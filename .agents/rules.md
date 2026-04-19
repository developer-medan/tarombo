# Project Rules & Guidelines

## Git Workflow
- **Strict Prohibition**: NEVER perform `git commit` or `git push` automatically.
- **Explicit Consent**: Only execute git commands (commit/push) when the user specifically asks for them in the current request.

## Architecture & Coding Standards
- **Clean Architecture**: Follow the Feature-First approach (Data, Domain, Presentation).
- **SOP Compliance**: Always follow the workflows defined in `.agents/workflows/`.
- **Error Handling**: Use `sealed class Failure` and the `.toFailure()` extension mapper.
- **UI Aesthetics**: Maintain a premium design with harmonious colors, gradients, and subtle animations.
