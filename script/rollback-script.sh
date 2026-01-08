# EMERGENCY ROLLBACK SCRIPT
# Use this to instantly return to v1.0 photo organizer state

echo "🚨 EMERGENCY ROLLBACK TO v1.0"
echo ""
echo "This will:"
echo "  1. Stash any uncommitted changes"
echo "  2. Switch to v1.0-photo-organizer tag"
echo "  3. Create a rollback branch for safety"
echo ""
read -p "Continue with rollback? (y/N) " -n 1 -r
echo ""

if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "❌ Rollback cancelled"
    exit 1
fi

# Stash current work
echo "💾 Stashing current changes..."
git stash save "Pre-rollback stash at $(date)"
echo "✓ Changes stashed"

# Create a snapshot of current state before rollback
CURRENT_BRANCH=$(git branch --show-current)
SNAPSHOT_NAME="before-rollback-$(date +%Y%m%d-%H%M%S)"

echo ""
echo "📸 Creating snapshot: $SNAPSHOT_NAME"
git branch $SNAPSHOT_NAME
echo "✓ Snapshot branch created (you can return with: git checkout $SNAPSHOT_NAME)"

# Checkout the v1.0 tag
echo ""
echo "⏮️  Rolling back to v1.0-photo-organizer..."
git checkout v1.0-photo-organizer

if [ $? -eq 0 ]; then
    echo "✓ Successfully rolled back to v1.0"
    echo ""
    echo "✅ ROLLBACK COMPLETE"
    echo ""
    echo "You are now at the v1.0-photo-organizer state."
    echo ""
    echo "🔄 What happened to your work?"
    echo "  • Uncommitted changes: Stashed (restore with 'git stash pop')"
    echo "  • Full state snapshot: Branch '$SNAPSHOT_NAME'"
    echo ""
    echo "📋 Next Steps:"
    echo "  • Test that v1.0 features work correctly"
    echo "  • Run: cd backend && python app.py"
    echo "  • Run: cd frontend && npm run dev"
    echo ""
    echo "🔙 To return to transformation work:"
    echo "  git checkout $SNAPSHOT_NAME"
    echo "  or"
    echo "  git checkout ai-transformation"
else
    echo "❌ Rollback failed. Your work is safe in stash."
    echo "   Contact for help or check git status"
fi