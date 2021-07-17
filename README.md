# Folder by Feature CLI Utility :open_file_folder:

> This is a WIP

A Dart CLI tool that generates the folder structure for the folder-by-feature pattern. This tool helps to reduce the repetitive work required to setup directories for models, services, repositories, screens and widgets.

The folder structure generated by the cli is as follows:

```md
feature/
┣ domain/
┃ ┣ feature_model.dart
┃ ┣ feature_repository.dart
┃ ┣ feature_service.dart
┃ ┗ feature_domain.dart
┣ screens/
┃ ┣ feature_screen.dart
┃ ┗ screens.dart
┣ widgets/
┃ ┣ feature_widget.dart
┃ ┗ widgets.dart
┣ providers/
┃ ┣ feature_provider.dart
┃ ┗ providers.dart
┗ index.dart
```

## Command Usage :wrench:
> Make sure you are in the root of your project
```sh
ff generate -n <feature_name>
```

:copyright: 2021 Ryan Dsilva