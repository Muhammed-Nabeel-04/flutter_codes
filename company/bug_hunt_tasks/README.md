# Bug Hunt Tasks — Debugging Practice App

This app has many bugs. Some crash with red error screens, some only print errors in the console, and some show no error at all but behave wrongly. Your job is to find and fix all of them.

## Setup

```bash
cd bug_hunt_tasks
flutter create .        # generates android/ and ios/ folders
flutter pub get
flutter run
```

## How to work

1. Run the app and use every screen and button: add, tick, delete, Clear completed, Open last viewed, Show tip, Tips screen, Next tip, opening a task and going back quickly.
2. When something breaks, read the first line of the error and find the first line in the stack trace that points to a file in `lib/`.
3. Use breakpoints, the Widget Inspector and the Layout Explorer — don't guess.
4. Fix one bug at a time and commit each fix separately.
5. Log every bug in `BUGS.md`:

| # | What I saw (symptom) | Cause | Fix | File |
| --- | --- | --- | --- | --- |

Hint: there are **16 bugs** — layout errors, runtime exceptions, and logic bugs that never show an error.
