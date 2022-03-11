variable "TAG" {
    default = "latest"
}

variable "REPO" {
    default = "larssonoliver/luci"
}

group "default" {
    targets = ["luci"]
}

target "luci" {
    context = "."
    dockerfile = "Dockerfile.buildx"
    platforms = [
        "linux/amd64", 
        "linux/arm/v7", 
        "linux/arm64",
    ]
    tags = [
        "${REPO}:latest", 
        "${REPO}:${TAG}",
    ]
}