# 📦 MakeZ

> A modular toolkit for creating your own global Make commands

MakeZ is a **boilerplate/framework** for building your personal automation toolbox. Clone it, add your own commands, and run them from anywhere.

The included modules are **examples** to get you started.

## 🚀 Install

```bash
# Clone the repository
git clone https://github.com/wguilherme/makez.git ~/makez

# Add alias to your shell
echo "alias makez='make -f ~/makez/Makefile'" >> ~/.zshrc
source ~/.zshrc

# Test it
makez help
```

## 🔧 Create Your First Command

Create a new file `makefiles/my-commands.mk`:

```makefile
.PHONY: hello db-backup

hello: ## Say hello
	@echo "Hello from MakeZ!"

db-backup: ## Backup database
	@pg_dump mydb > ~/backups/mydb-$(shell date +%Y%m%d).sql
	@echo "Backup done!"
```

That's it! Now run from anywhere:

```bash
makez hello
makez db-backup
```

## 📁 Structure

```
makez/
├── Makefile              # Main file (auto-includes all .mk modules)
├── makefiles/            # Your command modules
│   ├── docker.mk         # Docker utilities
│   └── example.mk        # Simple example
└── scripts/              # Helper shell scripts
```

## 📐 Naming Convention

Use `module-command` pattern to group related commands in help output:

```makefile
# makefiles/docker.mk
docker-ps: ## List containers
docker-clean: ## Remove stopped containers
docker-prune: ## Full cleanup
```

Since `makez help` sorts alphabetically, prefixed commands stay grouped:

```bash
docker-clean       Remove stopped containers
docker-prune       Full cleanup
docker-ps          List containers
```

See `makefiles/docker.mk` for a real example.

## 💡 Tips

- **Use `## description`** after targets for auto-generated help
- **One module per category**: `makefiles/docker.mk`, `makefiles/git.mk`
- **Scripts folder**: Put complex logic in `scripts/` and call from `.mk`

## 📝 License

MIT - Use it, fork it, make it yours.
