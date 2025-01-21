# custom_image_widget_sample

<video src="https://github.com/user-attachments/assets/f36ff598-0012-44d6-bf36-9f7d39e37a8a"></video>

これはImageWidgetを便利に使用するためのカスタムウィジェットのサンプルです。
このウィジェットを利用すると以下が自動的に設定されます。

- networkイメージ読み込みUI
- 取得したイメージのキャッシュ
- 読み込みエラー時のUI

そのほかfactoryコンストラクタを使用することで角丸や円の実装も簡単です。

## Getting Started

このプロジェクトは`fvm`を利用しています。

## Dependencies

- [cached_network_image](https://pub.dev/packages/cached_network_image)
- [shimmer](https://pub.dev/packages/shimmer)

## Example

`ImageType`の指定を行い、パスを指定します。
```dart
AppImage(
  path: 'https://images.unsplash.com/photo-1650930629267-293fd465fefb?q=80&w=3687&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  type: ImageType.url,
)
```
