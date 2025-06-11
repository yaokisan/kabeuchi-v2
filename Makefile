.PHONY: help setup dev dev-frontend dev-backend build clean lint format test

# デフォルトターゲット
help:
	@echo "使用可能なコマンド:"
	@echo "  make setup        - 依存関係のインストール"
	@echo "  make dev          - 開発サーバーの起動（Frontend + Backend）"
	@echo "  make dev-frontend - Frontendのみ起動"
	@echo "  make dev-backend  - Backendのみ起動"
	@echo "  make build        - プロダクションビルド"
	@echo "  make clean        - ビルド成果物のクリーンアップ"
	@echo "  make lint         - コードのLint実行"
	@echo "  make format       - コードフォーマット"
	@echo "  make test         - テスト実行"

# 依存関係のインストール
setup:
	@echo "Frontend依存関係をインストール中..."
	cd frontend && npm install
	@echo "Backend依存関係をインストール中..."
	cd backend && pip install -r requirements.txt
	@echo "セットアップ完了！"

# 開発サーバー起動
dev:
	@echo "開発サーバーを起動中..."
	@echo "Frontend: http://localhost:3002"
	@echo "Backend: http://localhost:8002"
	@make dev-backend & make dev-frontend

dev-frontend:
	cd frontend && npm run dev -- -p 3002

dev-backend:
	cd backend && uvicorn main:app --reload --port 8002

# ビルド
build:
	@echo "Frontendをビルド中..."
	cd frontend && npm run build
	@echo "Backend依存関係を更新中..."
	cd backend && pip freeze > requirements.txt
	@echo "ビルド完了！"

# クリーンアップ
clean:
	@echo "ビルド成果物をクリーンアップ中..."
	cd frontend && rm -rf .next out node_modules
	cd backend && find . -type d -name "__pycache__" -exec rm -rf {} + 2>/dev/null || true
	@echo "クリーンアップ完了！"

# Lint
lint:
	@echo "Frontendのlint実行中..."
	cd frontend && npm run lint
	@echo "Backendのlint実行中..."
	cd backend && python -m pylint **/*.py || true

# フォーマット
format:
	@echo "Frontendのフォーマット実行中..."
	cd frontend && npm run format
	@echo "Backendのフォーマット実行中..."
	cd backend && python -m black .

# テスト
test:
	@echo "テストを実行中..."
	cd frontend && npm test -- --passWithNoTests
	cd backend && python -m pytest || true