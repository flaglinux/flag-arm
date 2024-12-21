# Contributing to Flag-Arm

We welcome contributions to the Flag-Arm project! Whether you're fixing bugs, adding new features, improving documentation, or engaging in discussions, your input is valuable.

## Getting Started

1. **Fork the Repository**
   Fork the repository from [Flag-Arm GitHub](https://github.com/flaglinux/flag-arm.git) to your GitHub account.

2. **Clone Your Fork**
   ```bash
   git clone https://github.com/<your-username>/flag-arm.git
   cd flag-arm
   ```

3. **Set Upstream Remote**
   ```bash
   git remote add upstream https://github.com/flaglinux/flag-arm.git
   ```

## Guidelines

### Issues

- Search existing issues before opening a new one to avoid duplicates.
- Provide clear and descriptive titles and details for issues.

### Pull Requests

- Ensure your code adheres to the project's coding standards.
- Include tests for new features or fixes.
- Provide a detailed description of your changes.
- Reference related issues in your pull request description.
- Ensure your branch is up to date with the `main` branch before submitting a pull request.
  ```bash
  git fetch upstream
  git checkout main
  git merge upstream/main
  ```

### Coding Standards

- Follow the coding style used in the project.
- Include comments to explain complex logic.
- Keep commits focused; avoid mixing unrelated changes in a single commit.

### Commit Messages

- Use the following format for commit messages:
  ```
  <type>(<scope>): <subject>
  
  <body>
  ```
  Examples of `type`: `feat`, `fix`, `docs`, `style`, `refactor`, `test`, `chore`.

## Testing

- Run tests to ensure your changes don't break existing functionality.
- Add tests for new functionality wherever possible.

## Community

- Be respectful and inclusive in all interactions.
- Follow the [Code of Conduct](CODE_OF_CONDUCT.md).

## License

By contributing to this repository, you agree that your contributions will be licensed under the same license as the project.

---

Thank you for contributing to Flag-Arm!

