# Function to get the current Git branch
function Get-GitBranch {
    $branch = git rev-parse --abbrev-ref HEAD 2>$null
    if ($branch) {
        return "[$branch] "
    }
    return ""
}

# Define colors for username, directory, and Git branch
$ColorUser = "`e[38;5;243m"  # Gray
$ColorDir = "`e[38;5;197m"   # Pink
$ColorGit = "`e[38;5;39m"    # Blue
$ColorReset = "`e[0m"

# Customize the PowerShell prompt
function Prompt {
    $user = "$ColorUser$env:USERNAME$ColorReset"
    $dir = "$ColorDir$(Get-Location)$ColorReset"
    $gitBranch = "$ColorGit$(Get-GitBranch)$ColorReset"
    "$user $dir $gitBranch> "
}

# Enable ANSI escape sequences (needed for color support)
$Host.UI.RawUI.OutputEncoding = [System.Text.Encoding]::UTF8
