# Git

## Task 1:
**Create a local repo where you can put documents with information about the git command of your choice.**

**The information should include the following parts:**
 - **command usage syntax**
 - **general description**
 - **possible options and their purpose**
 - **examples of using the command with options**
 - **other optional information**

**Each part must be added as a separate commit.**

## Git config

### General Description

The `git config` command is used to configure various aspects of Git, such as user information, default behaviors, aliases, and more. Configuration options can be set at three different levels: system-wide, user-specific, and repository-specific.

### Command Usage Syntax

The `git config` syntax aligns with the general usage syntax:

```bash
git config [<options>] [<name> [<value>]]
```

### Possible Options and Their Purpose

- `--global`: This option sets the configuration at the user level, affecting all repositories for that user. It's usually used for setting personal information like name and email.
- `--system`: This option sets the configuration at the system level, affecting all users on the system. It requires administrator privileges.
- `--local` (default): This option sets the configuration at the repository level, only affecting the current repository.