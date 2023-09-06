# Get release or tag

This action will return a release name when tagging a release in Github. Otherwise it will return $GITHUB_SHA.

Usage:
```
on:
  release:
    types: [ published ]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: jayps/get-release-or-tag@1.0.0
        id: tag
      - name: Output tag
        env:
          RELEASE_VERSION: ${{ steps.tag.outputs.tag }}
        run: |
          echo $RELEASE_VERSION
          echo ${{ steps.tag.outputs.tag }}
      - uses: actions/checkout@v3

      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v2

      - name: Log in to container registry
        uses: docker/login-action@v2
        with:
          registry: yourregistryhere
          username: ${{ secrets.YOUR_DOCKER_USERNAME }}
          password: ${{ secrets.YOUR_DOCKER_PASSWORD }}

      - name: Build and push container image to registry
        uses: docker/build-push-action@v4
        with:
          push: true
          tags: your-registry.docker.io/your-image:${{ steps.tag.outputs.tag }}
          file: ./Dockerfile
```