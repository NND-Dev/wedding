# GitHub Pages Deployment Guide

This guide provides step-by-step instructions for deploying your Wedding Invitation Landing Page to GitHub Pages.

## 📋 Prerequisites

- Flutter SDK installed
- Git installed
- GitHub account
- Repository already created (`NND-Dev/wedding`)

## 🚀 Deployment Steps

### Step 1: Build for Web

1. Navigate to your project directory:
```bash
cd /path/to/wedding
```

2. Build the web version:
```bash
flutter build web --release --base-href /wedding/
```

**Note**: Replace `/wedding/` with your repository name if different. The format should be `/your-repo-name/`

### Step 2: Prepare GitHub Pages

#### Option A: Using gh-pages branch (Recommended)

1. Create a new `gh-pages` branch:
```bash
git checkout --orphan gh-pages
```

2. Remove all existing files:
```bash
git rm -rf .
```

3. Copy the built web files:
```bash
cp -r build/web/* .
```

4. Add a `.nojekyll` file to prevent Jekyll processing:
```bash
touch .nojekyll
```

5. Create a simple `.gitignore` for the gh-pages branch:
```bash
echo "# Ignore Flutter build artifacts that aren't needed" > .gitignore
```

6. Commit and push:
```bash
git add .
git commit -m "Deploy to GitHub Pages"
git push origin gh-pages
```

#### Option B: Using docs folder in main branch

1. Configure Flutter to build to docs folder:
```bash
# Build normally first
flutter build web --release --base-href /wedding/

# Copy to docs folder
rm -rf docs
cp -r build/web docs
```

2. Add `.nojekyll` to docs:
```bash
touch docs/.nojekyll
```

3. Commit and push:
```bash
git add docs
git commit -m "Add docs folder for GitHub Pages"
git push origin main
```

### Step 3: Configure GitHub Pages

1. Go to your repository on GitHub: `https://github.com/NND-Dev/wedding`

2. Navigate to **Settings** → **Pages**

3. Under **Source**:
   - For Option A: Select `gh-pages` branch and `/ (root)` folder
   - For Option B: Select `main` branch and `/docs` folder

4. Click **Save**

5. Wait a few minutes for deployment (usually 1-5 minutes)

6. Your site will be available at: `https://nnd-dev.github.io/wedding/`

## 🔄 Updating the Site

### For gh-pages branch approach:

```bash
# Switch back to main branch to make changes
git checkout main

# Make your changes...

# Build
flutter build web --release --base-href /wedding/

# Switch to gh-pages
git checkout gh-pages

# Copy new build
rm -rf !(.|.git|.nojekyll)  # Remove old files except git files
cp -r build/web/* .

# Commit and push
git add .
git commit -m "Update deployment"
git push origin gh-pages

# Switch back to main
git checkout main
```

### For docs folder approach:

```bash
# Make your changes on main branch

# Build
flutter build web --release --base-href /wedding/

# Update docs
rm -rf docs
cp -r build/web docs
touch docs/.nojekyll

# Commit and push
git add docs
git commit -m "Update website"
git push origin main
```

## 📝 Automation Script

Create a deployment script `deploy.sh`:

```bash
#!/bin/bash

# Deploy to GitHub Pages script
echo "🚀 Starting deployment..."

# Build the web app
echo "📦 Building Flutter web app..."
flutter build web --release --base-href /wedding/

# Check if build was successful
if [ $? -ne 0 ]; then
    echo "❌ Build failed!"
    exit 1
fi

# Save current branch
CURRENT_BRANCH=$(git branch --show-current)

# Switch to gh-pages branch
echo "🔄 Switching to gh-pages branch..."
git checkout gh-pages

# Copy build files
echo "📂 Copying build files..."
rm -rf !(.|.git|.nojekyll)
cp -r build/web/* .

# Commit changes
echo "💾 Committing changes..."
git add .
git commit -m "Deploy: $(date +'%Y-%m-%d %H:%M:%S')"

# Push to GitHub
echo "⬆️  Pushing to GitHub..."
git push origin gh-pages

# Switch back to original branch
echo "🔙 Switching back to $CURRENT_BRANCH..."
git checkout $CURRENT_BRANCH

echo "✅ Deployment complete!"
echo "🌐 Your site will be available at: https://nnd-dev.github.io/wedding/"
```

Make it executable:
```bash
chmod +x deploy.sh
```

Use it:
```bash
./deploy.sh
```

## 🔧 Troubleshooting

### Issue: 404 Page Not Found

**Solution**: Check the `base-href` in your build command matches your repository name:
```bash
flutter build web --release --base-href /wedding/
```

### Issue: Blank Page or Loading Issues

**Solution 1**: Add `.nojekyll` file to prevent Jekyll processing:
```bash
touch .nojekyll  # in your gh-pages branch root or docs folder
```

**Solution 2**: Check browser console for errors. If you see CORS errors, ensure all resources use relative paths.

### Issue: Images Not Loading

**Solution**: Ensure image URLs in your code are:
- Absolute URLs (https://...) for external images
- Relative paths for local assets
- Properly configured in `pubspec.yaml` for local assets

### Issue: Fonts Not Loading

**Solution**: Ensure `google_fonts` package properly fetches fonts. For offline deployment, download fonts locally and add to `pubspec.yaml`:

```yaml
flutter:
  fonts:
    - family: DancingScript
      fonts:
        - asset: fonts/DancingScript-Regular.ttf
```

### Issue: Old Version Still Showing

**Solution**: 
1. Clear browser cache (Ctrl+Shift+R / Cmd+Shift+R)
2. Wait a few minutes for GitHub Pages to update
3. Check the actual files in your gh-pages branch

## 🌐 Custom Domain (Optional)

To use a custom domain like `wedding.example.com`:

1. Add a `CNAME` file to your gh-pages branch or docs folder:
```bash
echo "wedding.example.com" > CNAME
git add CNAME
git commit -m "Add custom domain"
git push
```

2. In your domain registrar, add DNS records:
   - Type: CNAME
   - Name: wedding (or @)
   - Value: nnd-dev.github.io

3. In GitHub Pages settings, enter your custom domain

4. Enable "Enforce HTTPS" (after DNS propagates)

## 📊 Checking Deployment Status

Visit: `https://github.com/NND-Dev/wedding/deployments`

You can see:
- Deployment history
- Active deployments
- Deployment status (success/failure)

## 🔐 Security Considerations

1. **Don't commit sensitive data**:
   - No real bank account numbers
   - No personal phone numbers
   - No private addresses

2. **Environment Variables**:
   If you need to use API keys, use environment variables during build and inject them at build time.

3. **Form Submissions**:
   The current implementation handles form submissions in-app. For production, you'll need:
   - A backend API
   - Form submission service (FormSpree, Netlify Forms, etc.)

## 📱 Testing Your Deployment

1. **Test on multiple devices**:
   - Desktop browsers (Chrome, Firefox, Safari, Edge)
   - Mobile browsers (iOS Safari, Chrome Mobile)
   - Tablets

2. **Check responsive design**:
   - Use browser DevTools
   - Toggle device toolbar
   - Test different screen sizes

3. **Verify all features**:
   - Hero animation works
   - Timeline displays correctly
   - Gallery lightbox functions
   - Maps integration works
   - Form validation works
   - QR code displays

4. **Performance testing**:
   - Use Lighthouse in Chrome DevTools
   - Check page load speed
   - Verify image optimization

## 🎉 Success!

Your wedding invitation should now be live at:
**https://nnd-dev.github.io/wedding/**

Share this link with your guests! 💑

---

Need help? Check the [Flutter Web Deployment Documentation](https://docs.flutter.dev/deployment/web) or [GitHub Pages Documentation](https://docs.github.com/en/pages).
