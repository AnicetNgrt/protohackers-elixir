# 🚀 Protohackers

> **Elite network programming challenges solved with Elixir's superpowers**

[![Elixir](https://img.shields.io/badge/Elixir-4B275F?style=for-the-badge&logo=elixir&logoColor=white)](https://elixir-lang.org)
[![OTP](https://img.shields.io/badge/OTP-Powered-success?style=for-the-badge)](https://www.erlang.org/doc/design_principles/des_princ.html)
[![Fly.io](https://img.shields.io/badge/Deployed%20on-Fly.io-7C3AED?style=for-the-badge&logo=data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjAiIGhlaWdodD0iMjAiIHZpZXdCb3g9IjAgMCAyMCAyMCIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPHBhdGggZD0iTTEwIDIwQzE1LjUyMjggMjAgMjAgMTUuNTIyOCAyMCAxMEMyMCA0LjQ3NzE1IDE1LjUyMjggMCAxMCAwQzQuNDc3MTUgMCAwIDQuNDc3MTUgMCAxMEMwIDE1LjUyMjggNC40NzcxNSAyMCAxMCAyMFoiIGZpbGw9IndoaXRlIi8+PC9zdmc+)](https://fly.io)

Welcome to my implementation of the **Protohackers challenges** – a gauntlet of network programming problems that push the boundaries of what's possible with concurrent systems. This repository showcases battle-tested solutions using Elixir's actor model and OTP principles.

## 🎯 What is This?

Protohackers is like **LeetCode for network engineers** – a series of increasingly devious network protocol challenges that will make you question everything you know about TCP, UDP, and distributed systems. Each challenge is a real-world scenario disguised as a coding problem.

This implementation follows along with [Andrea Leopardi's excellent video series](https://www.youtube.com/playlist?list=PLd7I3U4fDsULTLqbRAkWzA002-IzMe8fl), where he tackles these challenges with wit, wisdom, and Elixir wizardry.

## 🏆 Challenges Conquered

| Problem | Protocol | Description | Difficulty |
|---------|----------|-------------|------------|
| **0. Smoke Test** | TCP | Echo server – the "Hello World" of network programming | ⭐ |
| **1. Prime Time** | TCP | JSON-based prime number checker with malformed input handling | ⭐⭐ |
| **2. Means to an End** | TCP | Binary protocol for time-series price tracking | ⭐⭐⭐ |
| **3. Budget Chat** | TCP | Multi-user chat room with presence tracking | ⭐⭐⭐ |
| **4. Unusual Database** | UDP | Key-value store over UDP with version conflicts | ⭐⭐⭐ |
| **5. Mob in the Middle** | TCP | MITM proxy that rewrites cryptocurrency addresses | ⭐⭐⭐⭐ |

## 💪 Why Elixir?

```elixir
# While others struggle with threads and locks...
# We spawn millions of processes like it's nothing
{:ok, pid} = Task.start(fn -> handle_universe() end)
```

- **Concurrent by Default**: Each connection gets its own lightweight process
- **Fault Tolerant**: Crashes are isolated and supervised
- **Message Passing**: No shared state, no race conditions, no tears
- **Hot Code Reloading**: Deploy without dropping connections
- **Battle-Tested**: Built on 30+ years of Erlang telecom heritage

## 🚀 Quick Start

### Prerequisites

```bash
# Check your Elixir version (need 1.14+)
elixir --version

# Don't have Elixir? Install it:
# macOS: brew install elixir
# Linux: Check https://elixir-lang.org/install.html
```

### Get It Running in 60 Seconds

```bash
# Clone this bad boy
git clone <repository-url>
cd protohackers-elixir

# Install dependencies (just Jason for JSON, we keep it lean)
mix deps.get

# Fire it up! 🔥
iex -S mix

# In another terminal, test the echo server:
echo "Hello, Protohackers!" | nc localhost 5000
```

### Run Individual Servers

```elixir
# In IEx, start specific challenges:
Protohackers.EchoServer.start_link(port: 5000)      # Problem 0
Protohackers.PrimerServer.start_link(port: 5001)    # Problem 1
Protohackers.PricesServer.start_link(port: 5002)    # Problem 2
Protohackers.BudgetChatServer.start_link(port: 5003) # Problem 3
```

### Testing

```bash
# Run all tests
mix test

# Run with coverage
mix test --cover

# Run specific test
mix test test/protohackers/echo_server_test.exs
```

## 🌍 Deploy to Production

Ready to unleash this on the internet? We're using **Fly.io** because they understand Elixir's clustering superpowers:

```bash
# First time setup
fly launch

# Deploy your changes
fly deploy

# Watch it go live
fly logs

# Scale horizontally (because we can)
fly scale count 3

# Check your deployment
fly status
```

Your servers will be available at:
- `your-app.fly.dev:5000` - Echo Server
- `your-app.fly.dev:5001` - Prime Time
- And so on...

## 🏗️ Architecture Highlights

```
┌─────────────┐     ┌──────────────┐     ┌─────────────┐
│   Client    │────▶│   Acceptor   │────▶│  Connection │
└─────────────┘     └──────────────┘     │   Process   │
                            │             └─────────────┘
                            │
                    ┌───────▼────────┐
                    │   Supervisor    │
                    │  (Auto-restart) │
                    └────────────────┘
```

Each server follows OTP design principles:
- **Acceptor Process**: Listens for connections
- **Connection Processes**: One per client, isolated failures
- **Supervisors**: Automatic recovery from crashes
- **GenServers**: State management where needed

## 📖 Learning Journey

### Watch & Learn
- 🎥 [Andrea Leopardi's Video Series](https://www.youtube.com/playlist?list=PLd7I3U4fDsULTLqbRAkWzA002-IzMe8fl) - The best way to understand these solutions
- 🏆 [Protohackers Official Site](https://protohackers.com) - The original challenges

### Level Up Your Elixir
- 📚 [Elixir in Action](https://www.manning.com/books/elixir-in-action-second-edition) - Deep dive into OTP
- 🔧 [Designing Elixir Systems](https://pragprog.com/titles/jgotp/designing-elixir-systems-with-otp/) - Architecture patterns
- 🌟 [ElixirForum](https://elixirforum.com) - Community wisdom

## 🤝 Contributing

Found a bug? Have a better solution? Want to add the next challenge?

1. Fork it
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Code Style
- Run `mix format` before committing
- Add tests for new features
- Keep the OTP way - let it crash, supervise it

## 🎯 Future Challenges

The journey continues! Upcoming problems to tackle:
- Problem 6: Speed Daemon - GPS tracking protocol
- Problem 7: Line Reversal - Reversing text protocol with sessions
- Problem 8: Insecure Sockets Layer - Custom encryption (what could go wrong?)

## 📜 License

MIT License - See [LICENSE](LICENSE) file for details.

---

<div align="center">

**Built with 💜 and Elixir** | **Powered by OTP** | **Deployed on Fly.io**

*"Let it crash" - Every Elixir developer, ever*

</div>