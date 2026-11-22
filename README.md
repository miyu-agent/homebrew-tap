# homebrew-tap

> <sub>本文档由 Anthropic 的 Claude Fable 5.2 生成。</sub>

这是 Miyu 系列程序的 Homebrew 软件源。

目前有 [LiteMiyu](https://github.com/miyu-agent/litemiyu) 的配方，支持 Apple 芯片的 macOS，以及 Linux 上的 Homebrew（x86_64、aarch64）。安装方法是：

```bash
brew install miyu-agent/tap/litemiyu
```

这里的配方由这个仓库的工作流（[`litemiyu.yml`](.github/workflows/litemiyu.yml)）在每次发版以后更新，请不要直接修改。工作流从程序的仓库取模板，核对发行包的哈希和构建出处证明，在 macOS 和 Linux 上真装一遍以后才提交。发现配方有问题时，请到对应程序的仓库提出。
