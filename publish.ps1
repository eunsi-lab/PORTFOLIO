# publish.ps1

# 1. Add all changes
Write-Host "Adding changes..." -ForegroundColor Green
git add .

# 2. Commit changes
$commitMessage = Read-Host "Enter commit message"
if ([string]::IsNullOrWhiteSpace($commitMessage)) {
    Write-Host "Commit message cannot be empty. Aborting." -ForegroundColor Red
    exit 1
}
git commit -m "$commitMessage"

# 3. Push to main
Write-Host "Pushing to GitHub (main branch)..." -ForegroundColor Green
git push origin main

# 4. Deploy to GitHub Pages
Write-Host "Deploying to GitHub Pages..." -ForegroundColor Green
cmd /c npm run deploy

Write-Host "Done! Your site should be live at https://eunsi-lab.github.io/PORTFOLIO/ in a few minutes." -ForegroundColor Cyan
