# Contributing to Beautiful Hyprland Configuration

Thank you for your interest in contributing to this project! We welcome contributions of all kinds, from bug reports and feature requests to code improvements and documentation updates.

## 🤝 Ways to Contribute

### Report Bugs
If you find a bug, please open an issue with:
- Clear description of the problem
- Steps to reproduce
- Expected vs actual behavior
- Your system information (OS, GPU, Hyprland version)
- Relevant configuration snippets

**Example:**
```
Title: Waybar not showing after installation
Description: After running install.sh on Arch Linux, Waybar doesn't appear
Steps:
1. Run ./install.sh
2. Log out and back in to Hyprland
3. Waybar doesn't show up

System: Arch Linux, NVIDIA GPU, Hyprland v0.32.0
```

### Suggest Features
Want to add a new feature? Open an issue describing:
- What you want to add
- Why it would be useful
- How it should work
- Any alternative approaches

**Example:**
```
Title: Add support for multiple color schemes
Description: Currently only Catppuccin is supported. It would be great to have...
Use case: Users with different preferences could quickly switch themes
```

### Improve Documentation
Documentation improvements are always welcome:
- Fix typos and grammatical errors
- Clarify confusing sections
- Add examples and use cases
- Update outdated information

### Submit Code
Want to submit code? Follow these guidelines:

#### 1. Fork the Repository
```bash
git clone https://github.com/YOUR-USERNAME/hyprland-beautiful-config.git
cd hyprland-beautiful-config
```

#### 2. Create a Feature Branch
```bash
git checkout -b feature/your-feature-name
# or for bug fixes:
git checkout -b fix/issue-description
```

#### 3. Make Your Changes
- Keep commits atomic and well-organized
- Write clear commit messages
- Test your changes thoroughly
- Update documentation if needed

#### 4. Follow Code Style
- Use consistent formatting
- Match existing style conventions
- Add comments for complex sections
- Keep lines reasonably short

#### 5. Test Thoroughly
```bash
# Test your configuration
hyprctl reload

# Check for syntax errors
hyprctl syntax ~/.config/hypr/hyprland.conf

# Test on a fresh installation if possible
```

#### 6. Submit a Pull Request
- Include a clear description of changes
- Reference related issues (#123)
- Add screenshots if UI changes
- Request review from maintainers

**PR Template:**
```markdown
## Description
Brief description of what this PR does

## Related Issues
Fixes #123
Related to #456

## Changes Made
- Change 1
- Change 2
- Change 3

## Testing
How to test these changes

## Screenshots
If applicable, add screenshots

## Checklist
- [ ] Code tested locally
- [ ] Documentation updated
- [ ] No breaking changes
- [ ] Follows project style
```

## 📋 Development Guidelines

### Configuration Files
- Configuration files should be well-commented
- Group related settings together
- Maintain Catppuccin color consistency
- Test on multiple distributions

### Shell Scripts
```bash
#!/bin/bash
# Brief description
set -e  # Exit on error

# Use meaningful variable names
# Add error handling
# Comment complex logic
# Make scripts idempotent (safe to run multiple times)
```

### Documentation
- Use clear, concise language
- Include examples and commands
- Add code blocks with syntax highlighting
- Keep formatting consistent
- Update table of contents if needed

### Commit Messages
```
feat: Add new feature
fix: Fix specific issue
docs: Update documentation
refactor: Improve code structure
test: Add or update tests
chore: Maintenance tasks

Keep subject line under 50 characters
Add detailed explanation in body if needed
Reference issues: Fixes #123
```

## 🎨 Configuration Standards

### Color Schemes
- Maintain Catppuccin consistency
- Test colors for readability
- Ensure proper contrast ratios
- Document color purposes

### Performance
- Consider system resource impact
- Profile changes for performance
- Avoid unnecessary blur/shadows
- Document optimization impacts

### Compatibility
- Test on Arch Linux, Ubuntu, Fedora
- Check GPU driver compatibility
- Ensure Wayland compatibility
- Document requirements

## 🔍 Code Review Process

1. **Automated Checks**
   - Syntax validation
   - File format checking
   - Documentation completeness

2. **Manual Review**
   - Code quality assessment
   - Configuration correctness
   - Documentation clarity
   - Testing verification

3. **Feedback**
   - Constructive comments
   - Suggestions for improvement
   - Questions for clarification

4. **Approval**
   - At least one maintainer review
   - All feedback addressed
   - Ready to merge

## 📚 Project Structure

```
.
├── README.md                 # Main documentation
├── FAQ.md                    # Frequently asked questions
├── COLORS.md                 # Color palette reference
├── PERFORMANCE.md            # Performance optimization
├── LICENSE                   # MIT License
├── install.sh                # Installation script
├── hyprland/                 # Hyprland configurations
│   ├── hyprland.conf
│   └── keybindings.conf
├── waybar/                   # Waybar panel configs
│   ├── config
│   ├── style.css
│   ├── dock-config
│   └── dock-style.css
├── rofi/                     # Application menu
│   ├── config.rasi
│   └── catppuccin.rasi
├── kitty/                    # Terminal configuration
│   ├── kitty.conf
│   └── color-scheme.conf
├── dunst/                    # Notifications
│   └── dunstrc
├── mako/                     # Alternative notifications
│   └── config
├── gtk/                      # GTK theme settings
│   ├── gtkrc-2.0
│   └── settings.ini
├── shell/                    # Shell integration
│   └── shell-config.sh
├── scripts/                  # Helper scripts
│   ├── hyprland-env.sh
│   └── xdg-portal-startup.sh
└── display-manager/          # DM session files
    └── hyprland.desktop
```

## 🚀 Getting Started

1. **Fork the repository**
2. **Clone your fork**
3. **Create a feature branch**
4. **Make your changes**
5. **Test thoroughly**
6. **Submit a pull request**

## ✅ Checklist for Contributors

Before submitting, ensure:
- [ ] Code follows project style
- [ ] Changes are tested
- [ ] Documentation is updated
- [ ] Commit messages are clear
- [ ] No unnecessary files added
- [ ] Follows shell script best practices
- [ ] Colors match Catppuccin
- [ ] No performance regressions
- [ ] Compatible with multiple distros

## 🐛 Bug Fix Process

1. **Identify the Issue**
   - Reproduce the bug
   - Understand root cause
   - Check existing issues

2. **Fix the Bug**
   - Make minimal changes
   - Add comments explaining fix
   - Test thoroughly

3. **Document the Fix**
   - Update CHANGELOG if applicable
   - Reference issue numbers
   - Explain what was wrong

4. **Submit for Review**
   - PR with clear description
   - Link to related issue
   - Mention affected users

## 🎯 Feature Request Process

1. **Propose the Feature**
   - Open an issue with description
   - Explain use case
   - Discuss implementation

2. **Get Feedback**
   - Respond to questions
   - Adjust proposal based on input
   - Reach consensus

3. **Implement**
   - Follow guidelines
   - Test thoroughly
   - Document changes

4. **Review and Merge**
   - Submit PR
   - Respond to feedback
   - Get approval

## 📞 Communication

- **Issues**: For bug reports and feature requests
- **Pull Requests**: For code changes
- **Discussions**: For general questions
- **Discord**: Join our community server (if available)

## 🎓 Learning Resources

- [Hyprland Documentation](https://wiki.hyprland.org)
- [Wayland Info](https://wayland.freedesktop.org/)
- [Git Guide](https://git-scm.com/book)
- [Markdown Guide](https://www.markdownguide.org/)
- [Shell Scripting](https://www.gnu.org/software/bash/manual/)

## 💡 Tips for Success

1. **Start Small**
   - Begin with documentation improvements
   - Work on small bugs first
   - Build up to major features

2. **Communicate**
   - Ask questions in issues
   - Discuss ideas before coding
   - Keep PR descriptions clear

3. **Be Patient**
   - Reviews take time
   - Feedback is constructive
   - Maintainers are volunteers

4. **Learn**
   - Study existing code
   - Ask how things work
   - Understand the project

5. **Have Fun**
   - Enjoy the process
   - Help others
   - Build something great

## 🏆 Recognition

Contributors will be:
- Listed in project documentation
- Mentioned in commit messages
- Recognized in release notes
- Added to contributors list

## ⚖️ Code of Conduct

We are committed to providing a welcoming and inclusive environment:

- Be respectful and kind
- Assume good intentions
- Provide constructive feedback
- Welcome diverse perspectives
- Report inappropriate behavior

## 📝 License

By contributing, you agree that your contributions will be licensed under the MIT License.

## 🤔 Questions?

- Check [FAQ.md](FAQ.md) for common questions
- Open an issue for help
- Review existing documentation
- Ask in discussions

---

**Thank you for contributing! We appreciate your help in making this project better! 🎉**

Happy coding! 🚀
