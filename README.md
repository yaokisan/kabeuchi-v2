# Kabeuchi v2 - 思考の壁打ちエディタ

次世代の思考壁打ちエディタ。高速なレスポンスとストリーミング対応により、長時間のAI推論でもタイムアウトしません。

## 技術スタック

- **Frontend**: Next.js 14 (App Router), TipTap Editor, Tailwind CSS, Zustand
- **Backend**: FastAPI, SSE (Server-Sent Events), Supabase
- **AI**: Gemini, Claude, GPT, o3対応

## セットアップ

### 1. 環境変数設定
```bash
cp .env.example .env
# .envファイルを編集して必要な値を設定
```

### 2. 依存関係インストール
```bash
make setup
```

### 3. 開発サーバー起動
```bash
make dev
```

- Frontend: http://localhost:3002
- Backend: http://localhost:8002

## 開発コマンド

```bash
make help    # 利用可能なコマンド一覧
make lint    # Lintチェック
make format  # コードフォーマット
make test    # テスト実行
make build   # プロダクションビルド
```

## プロジェクト構造

```
kabeuchi_v2/
├── frontend/         # Next.js フロントエンド
│   ├── app/         # App Router
│   ├── components/  # Reactコンポーネント
│   └── lib/         # ユーティリティ
├── backend/         # FastAPI バックエンド
│   ├── api/         # APIエンドポイント
│   ├── core/        # コア機能
│   └── services/    # ビジネスロジック
└── Makefile        # 開発タスク自動化
```

## 主な機能

- リアルタイムストリーミング対応のAIチャット
- 高性能なリッチテキストエディタ（TipTap）
- Web検索機能（Gemini）
- 画像アップロード対応
- ユーザー認証（Supabase Auth）
- ダークモード対応

## データベース

既存のSupabaseインスタンスと完全互換。既存データの移行は不要です。