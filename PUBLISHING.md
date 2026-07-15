# 博客发布流程

`D:\myblog` 是唯一需要长期维护的源码目录。文章、图片和配置都在这里修改。

## GitHub Pages 一次性设置

1. 打开仓库 `LeftEmotion/LeftEmotion.github.io`。
2. 进入 `Settings` -> `Pages`。
3. 在 `Build and deployment` 的 `Source` 中选择 `GitHub Actions`。

完成后，每次向 `hexo-source` 分支推送源码，GitHub Actions 都会自动构建和发布 Hexo 网站。

## 快速发布

在 CMD 中运行：

```cmd
cd /d D:\myblog
publish.cmd "更新文章"
```

脚本会先执行本地构建检查，再提交并推送 `hexo-source`。推送成功后，不需要再运行 `hexo deploy`，也不需要手动修改 `main`。

## 手动发布

```cmd
cd /d D:\myblog
pnpm.cmd run build
git add -A
git commit -m "更新文章"
git push origin hexo-source
```

## 目录规则

- 文章：`source\_posts`
- 图片：`source\img` 或 `source\images`
- Hexo 配置：`_config.yml`
- Fluid 配置：`_config.fluid.yml`
- 自定义域名：`source\CNAME`
- 不要手动修改：`public`、`.deploy_git`、GitHub 的 `main` 分支
