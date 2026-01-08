# PHASE 0 Step 0.1 - Safety Checkpoint Setup
# This script creates a safety checkpoint before transformation

echo "🔒 PHASE 0.1: Creating Safety Checkpoint"

# Check if git is initialized
if [ ! -d ".git" ]; then
    echo "⚠️  Git not initialized. Initializing now..."
    git init
    echo "✓ Git repository initialized"
fi

# Check for uncommitted changes
if [[ -n $(git status -s) ]]; then
    echo "📝 Uncommitted changes detected. Committing current state..."
    git add .
    git commit -m "Save working photo organizer v1.0 before AI transformation

- Working Flask backend with face recognition
- DBSCAN clustering for face grouping  
- SQLite database with full schema
- React frontend with upload/organize workflow
- Thumbnail generation working
- All current features tested and functional

This is the last checkpoint before transforming into 
a multi-modal RAG-based conversational AI assistant."
    echo "✓ Changes committed"
else
    echo "✓ Working directory clean"
fi

# Create the v1.0 tag
echo ""
echo "🏷️  Creating v1.0-photo-organizer tag..."
git tag -a v1.0-photo-organizer -m "Photo Organizer v1.0 - Working Baseline

Features:
- Face detection and clustering
- Photo organization by person
- Web interface with React
- SQLite backend

This tag marks the fully functional photo organizer 
before transformation into Lumeo AI system."

if [ $? -eq 0 ]; then
    echo "✓ Tag v1.0-photo-organizer created successfully"
else
    echo "⚠️  Tag might already exist. Use 'git tag -d v1.0-photo-organizer' to delete first."
fi

# Create transformation branch
echo ""
echo "🌿 Creating ai-transformation branch..."
git checkout -b ai-transformation

if [ $? -eq 0 ]; then
    echo "✓ Branch ai-transformation created and checked out"
    echo "  Current branch: $(git branch --show-current)"
else
    echo "⚠️  Branch might already exist. Switching to it..."
    git checkout ai-transformation
fi

echo ""
echo "✅ SAFETY CHECKPOINT COMPLETE"
echo ""
echo "📋 Summary:"
echo "  ✓ Current state committed"
echo "  ✓ Tag: v1.0-photo-organizer created"
echo "  ✓ Branch: ai-transformation ready"
echo ""
echo "🔙 Rollback Instructions:"
echo "  To restore v1.0: git checkout v1.0-photo-organizer"
echo "  To see all tags: git tag -l"
echo "  To compare: git diff v1.0-photo-organizer ai-transformation"
echo ""
echo "🚀 You're now ready to begin the transformation!"
echo "   Next: Run ./rollback-script.sh (created) to test rollback"