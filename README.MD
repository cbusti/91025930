cd /c/roject/91025930

# Create README.md with project description
cat << 'EOF' > README.md
# 🌳 Tree Visualizer Bash Script

This script recursively prints a directory tree using emoji and ANSI colors. It’s designed to make file structures visually engaging and educational.

## ✨ Features

- 📁 Random color-coded folders
- 💀 Spooky gray file names
- 🔍 Includes hidden files
- 🎨 Unicode and emoji feedback
- 🧠 Teaches Bash concepts through readable scripting

## 🚀 Usage

```bash
bash v2/tree-visualizer.sh /path/to/your/project

📦 Example Output

📁 my_project
│   📁 src
│   │   💀 main.py
│   │   💀 utils.py
│   📁 .git
│   │   💀 config
│   💀 README.md
