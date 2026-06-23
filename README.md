<!-- markdownlint-disable no-inline-html -->

<p align="center">
  <img alt="Codex Account Switcher Demo" src="./demo.gif" />
</p>
<!-- markdownlint-enable no-inline-html -->

# codex-account

[![GitHub Profile][github-image]][github-url]

> [!NOTE]
> A small CLI for switching Codex auth accounts by swapping `~/.codex/auth.json`.

Codex currently does not provide a UI for switching between saved profiles. If you use separate work and personal accounts, moving between them usually means re-authenticating or manually replacing `auth.json`.

This utility keeps named snapshots of authenticated accounts so you can move between them without logging in again each time.

## Installation

### macOS / Linux

```sh
# Clone the repository into Codex's config area
git clone https://github.com/hdphuc201/codex-account ~/.codex/.codex-account

# Expose the script as a runnable command from your local bin directory
ln -sfn ~/.codex/.codex-account/codex-account.sh ~/.local/bin/codex-account
```

> [!IMPORTANT]
> Make sure `~/.local/bin` is on your `PATH`.
> Otherwise, the `codex-account` command will not be available after creating the
> symlink.

### Windows

This project is implemented as a Bash script. On Windows, use one of these:

- Git Bash from Git for Windows
- WSL

To make `codex-account` callable from `cmd.exe` or PowerShell, use the included
Windows wrapper:

```powershell
# Clone the repository into Codex's config area
git clone https://github.com/hdphuc201/codex-account "$HOME/.codex/.codex-account"

# Create a personal bin directory if you do not already have one
New-Item -ItemType Directory -Force "$HOME/bin" | Out-Null

# Copy the Windows launcher into that bin directory
Copy-Item "$HOME/.codex/.codex-account/codex-account.cmd" "$HOME/bin/codex-account.cmd"
```

> [!IMPORTANT]
> Make sure `$HOME\bin` is on your `PATH`, and make sure `bash` is available
> from Git Bash / Git for Windows or WSL.

If you do not want to add a wrapper, you can also run the script directly:

```powershell
bash "$HOME/.codex/.codex-account/codex-account.sh" help
```

## Quick Start

```sh
# Log into one Codex account first, then save it
codex-account save personal

# Logout and login into another Codex account, then save that one too
codex-account save work

# See saved accounts and the current match
codex-account list

# Switch back to a saved account
codex-account switch personal

# Show the active account
codex-account current
```

## Commands

### `codex-account help`

Show the built-in help text.

### `codex-account list`

List saved accounts. `*` marks the account whose saved snapshot matches the live
`auth.json`. `~` marks the recorded current account when the live auth differs
from every saved snapshot.

### `codex-account current`

Print the active account name when it can be matched. If the live auth does not
match a saved snapshot, it reports the recorded account when available.

### `codex-account save <account>`

Save the current `~/.codex/auth.json` as `<account>.auth.json` and mark that
account as current.

### `codex-account switch <account>`

Back up the current auth as `<account>-backup.auth.json` when the current auth
can be associated with a saved account, then restore the requested saved
account into `~/.codex/auth.json`.

> [!IMPORTANT]
> Restart Codex after switching if it is already running.

### `codex-account <account>`

Shorthand for `codex-account switch <account>`.

## Notes

- This tool only swaps `auth.json`. It does not change the rest of `~/.codex`.
- Saved accounts live in `~/.codex/.codex-account/accounts`.
- Named backups are stored alongside saved accounts as `*-backup.auth.json`.
- To add a new account, log into it with Codex first, then run
  `codex-account save <account>`.
- Restart Codex after switching if it is already running.

## Contributing

Install the local Git hooks after cloning:

```sh
# Install the Git hooks managed by pre-commit
pre-commit install
```

## License

MIT © [hdphuc201](https://github.com/hdphuc201)

<!-- Badges -->

[github-image]: https://img.shields.io/badge/GitHub-hdphuc201-181717.svg?style=flat-square&logo=github
[github-url]: https://github.com/hdphuc201
