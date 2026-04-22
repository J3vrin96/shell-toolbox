
# Shell-toolbox Repository

Welcome to the **Shell-toolbox Repository**. This repository contains a collection of small shell scripts designed to automate common tasks, such as cleaning the Trash or Downloads folder via the terminal. These scripts are currently intended for use on macOS systems.

---


## Getting Started

To begin using the scripts in this repository, follow these steps:

1. **Clone the repository:**
	```sh
	git clone <repository-url>
	cd scripts
	```

2. **Review available scripts:**
	Explore the repository to see which scripts are available and read their individual instructions.

3. **Follow script-specific setup:**
	Each script may have its own prerequisites or setup steps. Refer to the documentation for each script (see below) before running.

## Script: `empty.sh`
### Prerequisites

1. **Environment Variables:**
	Before running `empty.sh`, define two environment variables according to your folder structure:
	```sh
	BIN_PATH=
	DOWNLOAD_PATH=
	```
	**Example:**
	```sh
	BIN_PATH="$HOME/.Trash"
	DOWNLOAD_PATH="$HOME/Downloads"
	```

2. **Alias Declaration:**
	To use the `empty` command conveniently from anywhere, declare an alias in your shell configuration file (`.bashrc` or `.zshrc`), depending on your shell and where the repository is located on your machine. For example:
	```sh
	# MacBook
	alias empty="$HOME/scripts/empty.sh"
	```
	After adding the alias, reload your shell configuration or restart your terminal session.

### Usage

You can execute `empty.sh` by running one of the following commands in your terminal:

```sh
# Clean Downloads folder
empty --downloads

# Clean Trash folder
empty --bin
```

Currently, `empty.sh` accepts two flags:

- `--bin` — Cleans the Trash folder
- `--downloads` — Cleans the Downloads folder

---

## Contributing

Feel free to contribute additional scripts or improvements by submitting a pull request or opening an issue.
