# Lesson 3 — ML Inference in Docker

Цей проєкт демонструє контейнеризацію TorchScript-моделі у двох варіантах:
fat-образ та slim-образ (multi-stage build).

## Структура проєкту

lesson-3/
- ├── Dockerfile.fat # великий образ з повним Python та залежностями.
- ├── Dockerfile.slim # оптимізований multi-stage образ.
- ├── export_model.py # TorchScript-модель (MobileNetV2).
- ├── inference.py # виконує top-3 передбачення.
- ├── model.pt # модель, збережена в .pt форматі за допомогою torch.jit
- ├── install_dev_tools.sh # Bash-скрипт для локальної інсталяції пакетів.
- ├── example.jpg # картинка, предбачення класу для якої виконується.
- ├── report.md # звітність, де порівнюється два образи.
- └──  README.md # інструкція з інсталяції


## 1. Побудова Docker-образів

### Fat-образ
```bash
docker build -f Dockerfile.fat -t ml-fat
```

### Slim-образ
```bash
docker build -f Dockerfile.slim -t ml-slim
```

## 2. Запуск inference
### Fat-образ
```bash
docker run --rm ml-fat example.jpg
```

### Slim-образ
```bash
docker run --rm ml-slim example.jpg
```
