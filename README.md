# Toilet Finder App

## Overview

The Toilet Finder app helps users locate nearby public toilets and view details such as cleanliness ratings, accessibility features, and user reviews. This document outlines the setup and architecture of the app, including the creation of an Xcode workspace, the configuration for programmatic UI without Storyboards, and the setup of a tab bar interface as the app's main navigation method.

## Project Setup

### Workspace Creation

1. **Create a New Workspace**: An Xcode workspace named `ToiletFinderAppWorkspace` was created to organize the app's main project and its related frameworks.

### Adding Projects to Workspace

1. **Main App Project**: The main application project, `ToiletFinder`, has been added to the workspace, configured for Swift, and supports iOS 13 and above.

2. **Frameworks**: The app is modularized into several frameworks to separate concerns:
   - `ToiletFinderUI`: Contains all UI-related components and screens.
   - `ToiletFinderDomain`: Includes the app's business logic and model definitions.
   - `ToiletFinderServices`: Manages external interactions, such as API requests.

### Disabling Storyboard

The app uses programmatic UIs instead of Storyboards. The `Main storyboard file base name` entry was removed from the `Info.plist` file to disable the default storyboard.

## SceneDelegate Configuration

The `SceneDelegate` configures the app's window and root view controller programmatically, initializing a `UITabBarController` with two main tabs:

1. **Toilet Map View**: A map displaying nearby toilets.
2. **Favourites View**: A list of user-favorited toilets.

Each tab is embedded in a `UINavigationController` for hierarchical navigation.

## UI Customization

Global appearance settings for `UITabBar` and `UINavigationBar` ensure a consistent look and feel:

```swift
UITabBar.appearance().tintColor = .systemBlue
UINavigationBar.appearance().tintColor = .systemBlue

