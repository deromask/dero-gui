package main

import (
	"derocore/plugins/derocore"
	flutter "github.com/go-flutter-desktop/go-flutter"
	"github.com/go-flutter-desktop/plugins/path_provider"
	"github.com/go-flutter-desktop/plugins/shared_preferences"
	"github.com/go-flutter-desktop/plugins/url_launcher"
	filepicker "github.com/miguelpruivo/flutter_file_picker/go"
)

var options = []flutter.Option{
	flutter.WindowInitialDimensions(450, 668),
	flutter.AddPlugin(&path_provider.PathProviderPlugin{
		VendorName:      "dero",
		ApplicationName: "dero",
	}),
	flutter.AddPlugin(&shared_preferences.SharedPreferencesPlugin{
    	VendorName:      "dero",
    	ApplicationName: "dero",
    }),
	flutter.AddPlugin(&filepicker.FilePickerPlugin{}),
	flutter.AddPlugin(&url_launcher.UrlLauncherPlugin{}),
	flutter.AddPlugin(&derocore.DeroCorePlugin{}),
}
