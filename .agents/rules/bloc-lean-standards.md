---
trigger: always_on
---

LEAN BLOC STANDARDS


No Business Logic: Move all decision-making logic to UseCases. BLoC should only call UseCases.

No Formatting Logic: Use Extensions/Mappers for data transformation (Date/Currency).

Listener Decoupling: Side effects (Navigation/Dialogs) must be handled in a separate listener function, not inside the build method.

No State Pollution: Do not store temporary UI variables in BLoC. Use local state or ValueNotifier if it's purely for UI behavior.