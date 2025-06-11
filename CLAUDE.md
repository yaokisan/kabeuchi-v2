# Claude開発メモ

## プロジェクト概要
- **プロジェクト名**: Kabeuchi v2 - 思考の壁打ちエディタ
- **技術スタック**: Next.js 14 + FastAPI + Supabase
- **本番URL**: https://kabeuchi-v2.vercel.app
- **GitHub**: https://github.com/yaokisan/kabeuchi-v2.git

## デプロイフロー（重要）
**正しい手順:**
1. `vercel --prod` でkabeuchi-v2.vercel.appに直接デプロイしてテスト
2. 問題なければGitHubにコミット・プッシュ（**ユーザーの指示があるまで勝手に実行しない**）
3. 自動デプロイでVercelに反映

**注意事項:**
- 新しいプロジェクトを立ち上げるのではなく、既存のkabeuchi-v2.vercel.appを使用
- GitHubへのコミット・プッシュは必ずユーザーの明示的な指示を待つ

## プロジェクト構造
```
kabeuchi_v2/
├── frontend/          # Next.js (メインアプリ)
├── backend/           # FastAPI (Serverless Functions)
├── vercel.json       # Vercel設定
└── Makefile          # 開発コマンド
```

## 環境変数
- `NEXT_PUBLIC_SUPABASE_URL`: https://ljagtjdiydjmrfsccdaj.supabase.co
- `NEXT_PUBLIC_SUPABASE_ANON_KEY`: 既存のSupabaseプロジェクト
- AIアプリキー: 既存の設定を継承

## 開発状況
- ✅ 基本UI/UXレイアウト完成
- 🔄 TipTapエディタ統合中
- ⏳ Supabase認証実装
- ⏳ AIチャット機能（ストリーミング）
- ⏳ ドキュメント管理機能

## 技術メモ
- ポート: Frontend 3002, Backend 8002
- Vercel統合プロジェクト: フロントエンド+API両対応
- 既存のSupabaseインスタンスと完全互換性維持