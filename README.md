# 🚀 Protohackers

A collection of network programming challenges implemented in Elixir, following [Andrea Leopardi's video series](https://www.youtube.com/playlist?list=PLd7I3U4fDsULTLqbRAkWzA002-IzMe8fl).

## 📋 Overview

Protohackers is a series of increasingly complex network programming problems designed to sharpen your skills in building robust, scalable network services. This implementation showcases the power of Elixir's concurrent programming model and fault-tolerant design principles.

## 🛠️ Tech Stack

- **Language**: Elixir
- **Framework**: OTP (Open Telecom Platform)
- **Deployment**: Fly.io
- **Dependencies**: Jason (JSON parsing)

## 🎯 Features

- **Concurrent TCP/UDP Servers**: Built using Elixir's lightweight processes
- **Protocol Implementation**: Custom binary and text protocols
- **Fault Tolerance**: Supervised processes with automatic recovery
- **Scalable Architecture**: Leveraging OTP patterns for production-ready code

## 🚦 Getting Started

### Prerequisites

- Elixir 1.14 or higher
- Mix build tool

### Installation

```bash
# Clone the repository
git clone <repository-url>
cd protohackers

# Install dependencies
mix deps.get

# Compile the project
mix compile
```

### Running Locally

```bash
# Start the application
mix run --no-halt

# Or use interactive shell
iex -S mix
```

### Running Tests

```bash
mix test
```

## 🚢 Deployment

This project is configured for deployment on Fly.io:

```bash
# Deploy to Fly.io
fly deploy

# Check deployment status
fly status
```

## 📚 Learning Resources

- [Andrea Leopardi's Video Series](https://www.youtube.com/playlist?list=PLd7I3U4fDsULTLqbRAkWzA002-IzMe8fl) - Complete walkthrough of each challenge
- [Protohackers Official Site](https://protohackers.com) - Challenge specifications
- [Elixir Documentation](https://elixir-lang.org/docs.html) - Official language docs
- [OTP Guide](https://elixir-lang.org/getting-started/mix-otp/introduction-to-mix.html) - Learn about OTP patterns

## 🤝 Contributing

Contributions are welcome! Feel free to:

- Report bugs
- Suggest new features
- Submit pull requests with improvements

## 📄 License

This project is open source and available under the MIT License.

---

Built with 💜 using Elixir | Deployed on 🚀 Fly.io