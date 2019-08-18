package;


import lime.utils.AssetLibrary;
import lime.utils.AssetManifest;
import lime.utils.Assets;

#if sys
import sys.FileSystem;
#end

@:access(lime.utils.Assets)


@:keep @:dox(hide) class ManifestResources {


	public static var preloadLibraries:Array<AssetLibrary>;
	public static var preloadLibraryNames:Array<String>;
	public static var rootPath:String;


	public static function init (config:Dynamic):Void {

		preloadLibraries = new Array ();
		preloadLibraryNames = new Array ();

		rootPath = null;

		if (config != null && Reflect.hasField (config, "rootPath")) {

			rootPath = Reflect.field (config, "rootPath");

		}

		if (rootPath == null) {

			#if (ios || tvos || emscripten)
			rootPath = "assets/";
			#elseif console
			rootPath = lime.system.System.applicationDirectory;
			#elseif (winrt)
			rootPath = "./";
			#elseif (sys && windows && !cs)
			rootPath = FileSystem.absolutePath (haxe.io.Path.directory (#if (haxe_ver >= 3.3) Sys.programPath () #else Sys.executablePath () #end)) + "/";
			#else
			rootPath = "";
			#end

		}

		Assets.defaultRootPath = rootPath;

		#if (openfl && !flash && !display)
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_pixelmplus12_regular_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_monsterrat_ttf);
		
		#end

		var data, manifest, library;

		#if kha

		null
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("null", library);

		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("null");

		#else

		data = '{"name":null,"assets":"aoy4:pathy36:assets%2Fmusic%2Fmusic-goes-here.txty4:sizezy4:typey4:TEXTy2:idR1y7:preloadtgoR0y33:assets%2Fimages%2Fcommon%2Fok.pngR2i331R3y5:IMAGER5R7R6tgoR0y40:assets%2Fimages%2Fcommon%2Fnum_arrow.pngR2i1182R3R8R5R9R6tgoR0y34:assets%2Fimages%2Fcommon%2Ftap.pngR2i4177R3R8R5R10R6tgoR0y36:assets%2Fimages%2Fcommon%2Farrow.pngR2i570R3R8R5R11R6tgoR0y42:assets%2Fimages%2Fcommon%2Fitem_button.pngR2i856R3R8R5R12R6tgoR0y35:assets%2Fimages%2Fcommon%2Fback.pngR2i373R3R8R5R13R6tgoR0y36:assets%2Fimages%2Fcommon%2Fclose.pngR2i380R3R8R5R14R6tgoR0y32:assets%2Fimages%2Fitem%2F002.pngR2i716R3R8R5R15R6tgoR0y32:assets%2Fimages%2Fitem%2F003.pngR2i630R3R8R5R16R6tgoR0y32:assets%2Fimages%2Fitem%2F001.pngR2i608R3R8R5R17R6tgoR0y32:assets%2Fimages%2Fitem%2F000.pngR2i442R3R8R5R18R6tgoR0y32:assets%2Fimages%2Fitem%2F010.pngR2i21104R3R8R5R19R6tgoR0y32:assets%2Fimages%2Fitem%2F004.pngR2i611R3R8R5R20R6tgoR0y32:assets%2Fimages%2Fitem%2F005.pngR2i754R3R8R5R21R6tgoR0y32:assets%2Fimages%2Fitem%2F011.pngR2i2722R3R8R5R22R6tgoR0y32:assets%2Fimages%2Fitem%2F007.pngR2i12585R3R8R5R23R6tgoR0y32:assets%2Fimages%2Fitem%2F012.pngR2i1704R3R8R5R24R6tgoR0y32:assets%2Fimages%2Fitem%2F006.pngR2i729R3R8R5R25R6tgoR0y32:assets%2Fimages%2Fitem%2F008.pngR2i26792R3R8R5R26R6tgoR0y32:assets%2Fimages%2Fitem%2F009.pngR2i12779R3R8R5R27R6tgoR0y36:assets%2Fimages%2Fimages-go-here.txtR2zR3R4R5R28R6tgoR0y45:assets%2Fimages%2Finputs%2F001%2Fpictures.pngR2i2904R3R8R5R29R6tgoR0y36:assets%2Fsounds%2Fsounds-go-here.txtR2zR3R4R5R30R6tgoR2i1274396R3y4:FONTy9:classNamey46:__ASSET__assets_fonts_pixelmplus12_regular_ttfR5y41:assets%2Ffonts%2FPixelMplus12-Regular.ttfR6tgoR0y34:assets%2Fdata%2Fdata-goes-here.txtR2zR3R4R5R35R6tgoR0y42:assets%2Fdata%2Fscene001%2Fknob_yellow.pngR2i339R3R8R5R36R6tgoR0y40:assets%2Fdata%2Fscene001%2Fknob_blue.pngR2i340R3R8R5R37R6tgoR0y39:assets%2Fdata%2Fscene001%2F001_knob.csvR2i447R3R4R5R38R6tgoR0y41:assets%2Fdata%2Fscene001%2Fknob_green.pngR2i339R3R8R5R39R6tgoR0y42:assets%2Fdata%2Fscene001%2F001_unlock2.csvR2i13R3R4R5R40R6tgoR0y42:assets%2Fdata%2Fscene001%2F001_sticker.csvR2i72R3R4R5R41R6tgoR0y37:assets%2Fdata%2Fscene001%2Flayout.xmlR2i797R3R4R5R42R6tgoR0y39:assets%2Fdata%2Fscene001%2Fknob_red.pngR2i338R3R8R5R43R6tgoR0y43:assets%2Fdata%2Fscene001%2Fpallete.asepriteR2i568R3y6:BINARYR5R44R6tgoR0y38:assets%2Fdata%2Fscene001%2Funlock2.pngR2i1124R3R8R5R46R6tgoR0y42:assets%2Fdata%2Fscene001%2F001_jump002.csvR2i15R3R4R5R47R6tgoR0y37:assets%2Fdata%2Fscene001%2Funlock.pngR2i1652R3R8R5R48R6tgoR0y38:assets%2Fdata%2Fscene001%2Fsticker.pngR2i521R3R8R5R49R6tgoR0y42:assets%2Fdata%2Fscene001%2F001_jump005.csvR2i15R3R4R5R50R6tgoR0y33:assets%2Fdata%2Fscene001%2Fbg.pngR2i2351R3R8R5R51R6tgoR0y42:assets%2Fdata%2Fscene003%2F003_jump002.csvR2i15R3R4R5R52R6tgoR0y45:assets%2Fdata%2Fscene003%2F003_yellow_key.csvR2i36R3R4R5R53R6tgoR0y42:assets%2Fdata%2Fscene003%2F003_jump001.csvR2i15R3R4R5R54R6tgoR0y37:assets%2Fdata%2Fscene003%2Fnumber.pngR2i207R3R8R5R55R6tgoR0y42:assets%2Fdata%2Fscene003%2F003_number2.csvR2i178R3R4R5R56R6tgoR0y36:assets%2Fdata%2Fscene003%2Flock2.pngR2i1315R3R8R5R57R6tgoR0y35:assets%2Fdata%2Fscene003%2Flock.pngR2i674R3R8R5R58R6tgoR0y40:assets%2Fdata%2Fscene003%2F003_lock2.csvR2i47R3R4R5R59R6tgoR0y38:assets%2Fdata%2Fscene003%2Fnumber2.pngR2i331R3R8R5R60R6tgoR0y37:assets%2Fdata%2Fscene003%2Flayout.xmlR2i709R3R4R5R61R6tgoR0y39:assets%2Fdata%2Fscene003%2F003_jump.csvR2i15R3R4R5R62R6tgoR0y41:assets%2Fdata%2Fscene003%2Fyellow_key.pngR2i608R3R8R5R63R6tgoR0y39:assets%2Fdata%2Fscene003%2F003_lock.csvR2i145R3R4R5R64R6tgoR0y38:assets%2Fdata%2Fscene003%2Funlock2.pngR2i1422R3R8R5R65R6tgoR0y37:assets%2Fdata%2Fscene003%2Funlock.pngR2i1294R3R8R5R66R6tgoR0y41:assets%2Fdata%2Fscene003%2F003_number.csvR2i38R3R4R5R67R6tgoR0y33:assets%2Fdata%2Fscene003%2Fbg.pngR2i2419R3R8R5R68R6tgoR0y37:assets%2Fdata%2Fscene004%2Flayout.xmlR2i356R3R4R5R69R6tgoR0y40:assets%2Fdata%2Fscene004%2F004_chair.csvR2i32R3R4R5R70R6tgoR0y36:assets%2Fdata%2Fscene004%2Fchair.pngR2i1482R3R8R5R71R6tgoR0y40:assets%2Fdata%2Fscene004%2F004_clock.csvR2i65R3R4R5R72R6tgoR0y36:assets%2Fdata%2Fscene004%2Fclock.pngR2i1451R3R8R5R73R6tgoR0y42:assets%2Fdata%2Fscene004%2F004_jump002.csvR2i15R3R4R5R74R6tgoR0y33:assets%2Fdata%2Fscene004%2Fbg.pngR2i4837R3R8R5R75R6tgoR0y39:assets%2Fdata%2Fscene004%2F004_jump.csvR2i15R3R4R5R76R6tgoR0y35:assets%2Fdata%2Fscene005%2Flock.pngR2i485R3R8R5R77R6tgoR0y42:assets%2Fdata%2Fscene005%2F005_jump001.csvR2i15R3R4R5R78R6tgoR0y42:assets%2Fdata%2Fscene005%2F005_jump004.csvR2i15R3R4R5R79R6tgoR0y44:assets%2Fdata%2Fscene005%2Fbottle_opener.pngR2i539R3R8R5R80R6tgoR0y37:assets%2Fdata%2Fscene005%2Flayout.xmlR2i546R3R4R5R81R6tgoR0y36:assets%2Fdata%2Fscene005%2Fchair.pngR2i1482R3R8R5R82R6tgoR0y48:assets%2Fdata%2Fscene005%2F005_bottle_opener.csvR2i44R3R4R5R83R6tgoR0y43:assets%2Fdata%2Fscene005%2F005_sticker1.csvR2i71R3R4R5R84R6tgoR0y39:assets%2Fdata%2Fscene005%2Fsticker1.pngR2i817R3R8R5R85R6tgoR0y40:assets%2Fdata%2Fscene005%2F005_chair.csvR2i32R3R4R5R86R6tgoR0y39:assets%2Fdata%2Fscene005%2F005_lock.csvR2i15R3R4R5R87R6tgoR0y33:assets%2Fdata%2Fscene005%2Fbg.pngR2i2649R3R8R5R88R6tgoR0y39:assets%2Fdata%2Fscene002%2Fgraffiti.pngR2i522R3R8R5R89R6tgoR0y38:assets%2Fdata%2Fscene002%2Fdrawer2.pngR2i1198R3R8R5R90R6tgoR0y43:assets%2Fdata%2Fscene002%2F002_graffiti.csvR2i65R3R4R5R91R6tgoR0y41:assets%2Fdata%2Fscene002%2F002_hidden.csvR2i100R3R4R5R92R6tgoR0y38:assets%2Fdata%2Fscene002%2Fdrawer1.pngR2i449R3R8R5R93R6tgoR0y46:assets%2Fdata%2Fscene002%2F002_floppy_disk.csvR2i79R3R4R5R94R6tgoR0y43:assets%2Fdata%2Fscene002%2F002_drawer1b.csvR2i21R3R4R5R95R6tgoR0y39:assets%2Fdata%2Fscene002%2Fblue_key.pngR2i630R3R8R5R96R6tgoR0y43:assets%2Fdata%2Fscene002%2F002_blue_key.csvR2i36R3R4R5R97R6tgoR0y43:assets%2Fdata%2Fscene002%2F002_drawer1a.csvR2i21R3R4R5R98R6tgoR0y37:assets%2Fdata%2Fscene002%2Fhidden.pngR2i100R3R8R5R99R6tgoR0y42:assets%2Fdata%2Fscene002%2Ffloppy_disk.pngR2i729R3R8R5R100R6tgoR0y37:assets%2Fdata%2Fscene002%2Flayout.xmlR2i1251R3R4R5R101R6tgoR0y42:assets%2Fdata%2Fscene002%2F002_jump004.csvR2i15R3R4R5R102R6tgoR0y42:assets%2Fdata%2Fscene002%2F002_jump001.csvR2i15R3R4R5R103R6tgoR0y44:assets%2Fdata%2Fscene002%2F002_pic_input.csvR2i153R3R4R5R104R6tgoR0y40:assets%2Fdata%2Fscene002%2Fpic_input.pngR2i553R3R8R5R105R6tgoR0y43:assets%2Fdata%2Fscene002%2F002_drawer2a.csvR2i21R3R4R5R106R6tgoR0y36:assets%2Fdata%2Fscene002%2Fglass.pngR2i937R3R8R5R107R6tgoR0y43:assets%2Fdata%2Fscene002%2F002_drawer2b.csvR2i21R3R4R5R108R6tgoR0y39:assets%2Fdata%2Fscene002%2Funlocked.pngR2i1464R3R8R5R109R6tgoR0y40:assets%2Fdata%2Fscene002%2Fgreen_key.pngR2i611R3R8R5R110R6tgoR0y44:assets%2Fdata%2Fscene002%2F002_green_key.csvR2i36R3R4R5R111R6tgoR0y40:assets%2Fdata%2Fscene002%2F002_glass.csvR2i79R3R4R5R112R6tgoR0y33:assets%2Fdata%2Fscene002%2Fbg.pngR2i3018R3R8R5R113R6tgoR2i39706R3y5:MUSICR5y28:flixel%2Fsounds%2Fflixel.mp3y9:pathGroupaR115y28:flixel%2Fsounds%2Fflixel.ogghR6tgoR2i2114R3R114R5y26:flixel%2Fsounds%2Fbeep.mp3R116aR118y26:flixel%2Fsounds%2Fbeep.ogghR6tgoR2i5794R3y5:SOUNDR5R119R116aR118R119hgoR2i33629R3R120R5R117R116aR115R117hgoR2i15744R3R31R32y35:__ASSET__flixel_fonts_nokiafc22_ttfR5y30:flixel%2Ffonts%2Fnokiafc22.ttfR6tgoR2i29724R3R31R32y36:__ASSET__flixel_fonts_monsterrat_ttfR5y31:flixel%2Ffonts%2Fmonsterrat.ttfR6tgoR0y33:flixel%2Fimages%2Fui%2Fbutton.pngR2i519R3R8R5R125R6tgoR0y36:flixel%2Fimages%2Flogo%2Fdefault.pngR2i3280R3R8R5R126R6tgh","rootPath":null,"version":2,"libraryArgs":[],"libraryType":null}';
		manifest = AssetManifest.parse (data, rootPath);
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("default", library);
		

		library = Assets.getLibrary ("default");
		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("default");
		

		#end

	}


}


#if kha

null

#else

#if !display
#if flash

@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_music_goes_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_common_ok_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_common_num_arrow_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_common_tap_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_common_arrow_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_common_item_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_common_back_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_common_close_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_item_002_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_item_003_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_item_001_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_item_000_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_item_010_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_item_004_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_item_005_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_item_011_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_item_007_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_item_012_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_item_006_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_item_008_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_item_009_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_images_go_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_inputs_001_pictures_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_fonts_pixelmplus12_regular_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_data_goes_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_scene001_knob_yellow_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_scene001_knob_blue_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_scene001_001_knob_csv extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_scene001_knob_green_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_scene001_001_unlock2_csv extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_scene001_001_sticker_csv extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_scene001_layout_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_scene001_knob_red_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_scene001_pallete_aseprite extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_scene001_unlock2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_scene001_001_jump002_csv extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_scene001_unlock_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_scene001_sticker_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_scene001_001_jump005_csv extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_scene001_bg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_scene003_003_jump002_csv extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_scene003_003_yellow_key_csv extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_scene003_003_jump001_csv extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_scene003_number_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_scene003_003_number2_csv extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_scene003_lock2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_scene003_lock_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_scene003_003_lock2_csv extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_scene003_number2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_scene003_layout_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_scene003_003_jump_csv extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_scene003_yellow_key_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_scene003_003_lock_csv extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_scene003_unlock2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_scene003_unlock_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_scene003_003_number_csv extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_scene003_bg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_scene004_layout_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_scene004_004_chair_csv extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_scene004_chair_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_scene004_004_clock_csv extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_scene004_clock_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_scene004_004_jump002_csv extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_scene004_bg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_scene004_004_jump_csv extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_scene005_lock_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_scene005_005_jump001_csv extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_scene005_005_jump004_csv extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_scene005_bottle_opener_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_scene005_layout_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_scene005_chair_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_scene005_005_bottle_opener_csv extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_scene005_005_sticker1_csv extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_scene005_sticker1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_scene005_005_chair_csv extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_scene005_005_lock_csv extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_scene005_bg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_scene002_graffiti_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_scene002_drawer2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_scene002_002_graffiti_csv extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_scene002_002_hidden_csv extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_scene002_drawer1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_scene002_002_floppy_disk_csv extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_scene002_002_drawer1b_csv extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_scene002_blue_key_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_scene002_002_blue_key_csv extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_scene002_002_drawer1a_csv extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_scene002_hidden_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_scene002_floppy_disk_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_scene002_layout_xml extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_scene002_002_jump004_csv extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_scene002_002_jump001_csv extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_scene002_002_pic_input_csv extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_scene002_pic_input_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_scene002_002_drawer2a_csv extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_scene002_glass_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_scene002_002_drawer2b_csv extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_scene002_unlocked_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_scene002_green_key_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_scene002_002_green_key_csv extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_scene002_002_glass_csv extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_scene002_bg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_default_json extends null { }


#elseif (desktop || cpp)

@:keep @:file("assets/music/music-goes-here.txt") @:noCompletion #if display private #end class __ASSET__assets_music_music_goes_here_txt extends haxe.io.Bytes {}
@:keep @:image("assets/images/common/ok.png") @:noCompletion #if display private #end class __ASSET__assets_images_common_ok_png extends lime.graphics.Image {}
@:keep @:image("assets/images/common/num_arrow.png") @:noCompletion #if display private #end class __ASSET__assets_images_common_num_arrow_png extends lime.graphics.Image {}
@:keep @:image("assets/images/common/tap.png") @:noCompletion #if display private #end class __ASSET__assets_images_common_tap_png extends lime.graphics.Image {}
@:keep @:image("assets/images/common/arrow.png") @:noCompletion #if display private #end class __ASSET__assets_images_common_arrow_png extends lime.graphics.Image {}
@:keep @:image("assets/images/common/item_button.png") @:noCompletion #if display private #end class __ASSET__assets_images_common_item_button_png extends lime.graphics.Image {}
@:keep @:image("assets/images/common/back.png") @:noCompletion #if display private #end class __ASSET__assets_images_common_back_png extends lime.graphics.Image {}
@:keep @:image("assets/images/common/close.png") @:noCompletion #if display private #end class __ASSET__assets_images_common_close_png extends lime.graphics.Image {}
@:keep @:image("assets/images/item/002.png") @:noCompletion #if display private #end class __ASSET__assets_images_item_002_png extends lime.graphics.Image {}
@:keep @:image("assets/images/item/003.png") @:noCompletion #if display private #end class __ASSET__assets_images_item_003_png extends lime.graphics.Image {}
@:keep @:image("assets/images/item/001.png") @:noCompletion #if display private #end class __ASSET__assets_images_item_001_png extends lime.graphics.Image {}
@:keep @:image("assets/images/item/000.png") @:noCompletion #if display private #end class __ASSET__assets_images_item_000_png extends lime.graphics.Image {}
@:keep @:image("assets/images/item/010.png") @:noCompletion #if display private #end class __ASSET__assets_images_item_010_png extends lime.graphics.Image {}
@:keep @:image("assets/images/item/004.png") @:noCompletion #if display private #end class __ASSET__assets_images_item_004_png extends lime.graphics.Image {}
@:keep @:image("assets/images/item/005.png") @:noCompletion #if display private #end class __ASSET__assets_images_item_005_png extends lime.graphics.Image {}
@:keep @:image("assets/images/item/011.png") @:noCompletion #if display private #end class __ASSET__assets_images_item_011_png extends lime.graphics.Image {}
@:keep @:image("assets/images/item/007.png") @:noCompletion #if display private #end class __ASSET__assets_images_item_007_png extends lime.graphics.Image {}
@:keep @:image("assets/images/item/012.png") @:noCompletion #if display private #end class __ASSET__assets_images_item_012_png extends lime.graphics.Image {}
@:keep @:image("assets/images/item/006.png") @:noCompletion #if display private #end class __ASSET__assets_images_item_006_png extends lime.graphics.Image {}
@:keep @:image("assets/images/item/008.png") @:noCompletion #if display private #end class __ASSET__assets_images_item_008_png extends lime.graphics.Image {}
@:keep @:image("assets/images/item/009.png") @:noCompletion #if display private #end class __ASSET__assets_images_item_009_png extends lime.graphics.Image {}
@:keep @:file("assets/images/images-go-here.txt") @:noCompletion #if display private #end class __ASSET__assets_images_images_go_here_txt extends haxe.io.Bytes {}
@:keep @:image("assets/images/inputs/001/pictures.png") @:noCompletion #if display private #end class __ASSET__assets_images_inputs_001_pictures_png extends lime.graphics.Image {}
@:keep @:file("assets/sounds/sounds-go-here.txt") @:noCompletion #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends haxe.io.Bytes {}
@:keep @:font("export/html5/obj/webfont/PixelMplus12-Regular.ttf") @:noCompletion #if display private #end class __ASSET__assets_fonts_pixelmplus12_regular_ttf extends lime.text.Font {}
@:keep @:file("assets/data/data-goes-here.txt") @:noCompletion #if display private #end class __ASSET__assets_data_data_goes_here_txt extends haxe.io.Bytes {}
@:keep @:image("assets/data/scene001/knob_yellow.png") @:noCompletion #if display private #end class __ASSET__assets_data_scene001_knob_yellow_png extends lime.graphics.Image {}
@:keep @:image("assets/data/scene001/knob_blue.png") @:noCompletion #if display private #end class __ASSET__assets_data_scene001_knob_blue_png extends lime.graphics.Image {}
@:keep @:file("assets/data/scene001/001_knob.csv") @:noCompletion #if display private #end class __ASSET__assets_data_scene001_001_knob_csv extends haxe.io.Bytes {}
@:keep @:image("assets/data/scene001/knob_green.png") @:noCompletion #if display private #end class __ASSET__assets_data_scene001_knob_green_png extends lime.graphics.Image {}
@:keep @:file("assets/data/scene001/001_unlock2.csv") @:noCompletion #if display private #end class __ASSET__assets_data_scene001_001_unlock2_csv extends haxe.io.Bytes {}
@:keep @:file("assets/data/scene001/001_sticker.csv") @:noCompletion #if display private #end class __ASSET__assets_data_scene001_001_sticker_csv extends haxe.io.Bytes {}
@:keep @:file("assets/data/scene001/layout.xml") @:noCompletion #if display private #end class __ASSET__assets_data_scene001_layout_xml extends haxe.io.Bytes {}
@:keep @:image("assets/data/scene001/knob_red.png") @:noCompletion #if display private #end class __ASSET__assets_data_scene001_knob_red_png extends lime.graphics.Image {}
@:keep @:file("assets/data/scene001/pallete.aseprite") @:noCompletion #if display private #end class __ASSET__assets_data_scene001_pallete_aseprite extends haxe.io.Bytes {}
@:keep @:image("assets/data/scene001/unlock2.png") @:noCompletion #if display private #end class __ASSET__assets_data_scene001_unlock2_png extends lime.graphics.Image {}
@:keep @:file("assets/data/scene001/001_jump002.csv") @:noCompletion #if display private #end class __ASSET__assets_data_scene001_001_jump002_csv extends haxe.io.Bytes {}
@:keep @:image("assets/data/scene001/unlock.png") @:noCompletion #if display private #end class __ASSET__assets_data_scene001_unlock_png extends lime.graphics.Image {}
@:keep @:image("assets/data/scene001/sticker.png") @:noCompletion #if display private #end class __ASSET__assets_data_scene001_sticker_png extends lime.graphics.Image {}
@:keep @:file("assets/data/scene001/001_jump005.csv") @:noCompletion #if display private #end class __ASSET__assets_data_scene001_001_jump005_csv extends haxe.io.Bytes {}
@:keep @:image("assets/data/scene001/bg.png") @:noCompletion #if display private #end class __ASSET__assets_data_scene001_bg_png extends lime.graphics.Image {}
@:keep @:file("assets/data/scene003/003_jump002.csv") @:noCompletion #if display private #end class __ASSET__assets_data_scene003_003_jump002_csv extends haxe.io.Bytes {}
@:keep @:file("assets/data/scene003/003_yellow_key.csv") @:noCompletion #if display private #end class __ASSET__assets_data_scene003_003_yellow_key_csv extends haxe.io.Bytes {}
@:keep @:file("assets/data/scene003/003_jump001.csv") @:noCompletion #if display private #end class __ASSET__assets_data_scene003_003_jump001_csv extends haxe.io.Bytes {}
@:keep @:image("assets/data/scene003/number.png") @:noCompletion #if display private #end class __ASSET__assets_data_scene003_number_png extends lime.graphics.Image {}
@:keep @:file("assets/data/scene003/003_number2.csv") @:noCompletion #if display private #end class __ASSET__assets_data_scene003_003_number2_csv extends haxe.io.Bytes {}
@:keep @:image("assets/data/scene003/lock2.png") @:noCompletion #if display private #end class __ASSET__assets_data_scene003_lock2_png extends lime.graphics.Image {}
@:keep @:image("assets/data/scene003/lock.png") @:noCompletion #if display private #end class __ASSET__assets_data_scene003_lock_png extends lime.graphics.Image {}
@:keep @:file("assets/data/scene003/003_lock2.csv") @:noCompletion #if display private #end class __ASSET__assets_data_scene003_003_lock2_csv extends haxe.io.Bytes {}
@:keep @:image("assets/data/scene003/number2.png") @:noCompletion #if display private #end class __ASSET__assets_data_scene003_number2_png extends lime.graphics.Image {}
@:keep @:file("assets/data/scene003/layout.xml") @:noCompletion #if display private #end class __ASSET__assets_data_scene003_layout_xml extends haxe.io.Bytes {}
@:keep @:file("assets/data/scene003/003_jump.csv") @:noCompletion #if display private #end class __ASSET__assets_data_scene003_003_jump_csv extends haxe.io.Bytes {}
@:keep @:image("assets/data/scene003/yellow_key.png") @:noCompletion #if display private #end class __ASSET__assets_data_scene003_yellow_key_png extends lime.graphics.Image {}
@:keep @:file("assets/data/scene003/003_lock.csv") @:noCompletion #if display private #end class __ASSET__assets_data_scene003_003_lock_csv extends haxe.io.Bytes {}
@:keep @:image("assets/data/scene003/unlock2.png") @:noCompletion #if display private #end class __ASSET__assets_data_scene003_unlock2_png extends lime.graphics.Image {}
@:keep @:image("assets/data/scene003/unlock.png") @:noCompletion #if display private #end class __ASSET__assets_data_scene003_unlock_png extends lime.graphics.Image {}
@:keep @:file("assets/data/scene003/003_number.csv") @:noCompletion #if display private #end class __ASSET__assets_data_scene003_003_number_csv extends haxe.io.Bytes {}
@:keep @:image("assets/data/scene003/bg.png") @:noCompletion #if display private #end class __ASSET__assets_data_scene003_bg_png extends lime.graphics.Image {}
@:keep @:file("assets/data/scene004/layout.xml") @:noCompletion #if display private #end class __ASSET__assets_data_scene004_layout_xml extends haxe.io.Bytes {}
@:keep @:file("assets/data/scene004/004_chair.csv") @:noCompletion #if display private #end class __ASSET__assets_data_scene004_004_chair_csv extends haxe.io.Bytes {}
@:keep @:image("assets/data/scene004/chair.png") @:noCompletion #if display private #end class __ASSET__assets_data_scene004_chair_png extends lime.graphics.Image {}
@:keep @:file("assets/data/scene004/004_clock.csv") @:noCompletion #if display private #end class __ASSET__assets_data_scene004_004_clock_csv extends haxe.io.Bytes {}
@:keep @:image("assets/data/scene004/clock.png") @:noCompletion #if display private #end class __ASSET__assets_data_scene004_clock_png extends lime.graphics.Image {}
@:keep @:file("assets/data/scene004/004_jump002.csv") @:noCompletion #if display private #end class __ASSET__assets_data_scene004_004_jump002_csv extends haxe.io.Bytes {}
@:keep @:image("assets/data/scene004/bg.png") @:noCompletion #if display private #end class __ASSET__assets_data_scene004_bg_png extends lime.graphics.Image {}
@:keep @:file("assets/data/scene004/004_jump.csv") @:noCompletion #if display private #end class __ASSET__assets_data_scene004_004_jump_csv extends haxe.io.Bytes {}
@:keep @:image("assets/data/scene005/lock.png") @:noCompletion #if display private #end class __ASSET__assets_data_scene005_lock_png extends lime.graphics.Image {}
@:keep @:file("assets/data/scene005/005_jump001.csv") @:noCompletion #if display private #end class __ASSET__assets_data_scene005_005_jump001_csv extends haxe.io.Bytes {}
@:keep @:file("assets/data/scene005/005_jump004.csv") @:noCompletion #if display private #end class __ASSET__assets_data_scene005_005_jump004_csv extends haxe.io.Bytes {}
@:keep @:image("assets/data/scene005/bottle_opener.png") @:noCompletion #if display private #end class __ASSET__assets_data_scene005_bottle_opener_png extends lime.graphics.Image {}
@:keep @:file("assets/data/scene005/layout.xml") @:noCompletion #if display private #end class __ASSET__assets_data_scene005_layout_xml extends haxe.io.Bytes {}
@:keep @:image("assets/data/scene005/chair.png") @:noCompletion #if display private #end class __ASSET__assets_data_scene005_chair_png extends lime.graphics.Image {}
@:keep @:file("assets/data/scene005/005_bottle_opener.csv") @:noCompletion #if display private #end class __ASSET__assets_data_scene005_005_bottle_opener_csv extends haxe.io.Bytes {}
@:keep @:file("assets/data/scene005/005_sticker1.csv") @:noCompletion #if display private #end class __ASSET__assets_data_scene005_005_sticker1_csv extends haxe.io.Bytes {}
@:keep @:image("assets/data/scene005/sticker1.png") @:noCompletion #if display private #end class __ASSET__assets_data_scene005_sticker1_png extends lime.graphics.Image {}
@:keep @:file("assets/data/scene005/005_chair.csv") @:noCompletion #if display private #end class __ASSET__assets_data_scene005_005_chair_csv extends haxe.io.Bytes {}
@:keep @:file("assets/data/scene005/005_lock.csv") @:noCompletion #if display private #end class __ASSET__assets_data_scene005_005_lock_csv extends haxe.io.Bytes {}
@:keep @:image("assets/data/scene005/bg.png") @:noCompletion #if display private #end class __ASSET__assets_data_scene005_bg_png extends lime.graphics.Image {}
@:keep @:image("assets/data/scene002/graffiti.png") @:noCompletion #if display private #end class __ASSET__assets_data_scene002_graffiti_png extends lime.graphics.Image {}
@:keep @:image("assets/data/scene002/drawer2.png") @:noCompletion #if display private #end class __ASSET__assets_data_scene002_drawer2_png extends lime.graphics.Image {}
@:keep @:file("assets/data/scene002/002_graffiti.csv") @:noCompletion #if display private #end class __ASSET__assets_data_scene002_002_graffiti_csv extends haxe.io.Bytes {}
@:keep @:file("assets/data/scene002/002_hidden.csv") @:noCompletion #if display private #end class __ASSET__assets_data_scene002_002_hidden_csv extends haxe.io.Bytes {}
@:keep @:image("assets/data/scene002/drawer1.png") @:noCompletion #if display private #end class __ASSET__assets_data_scene002_drawer1_png extends lime.graphics.Image {}
@:keep @:file("assets/data/scene002/002_floppy_disk.csv") @:noCompletion #if display private #end class __ASSET__assets_data_scene002_002_floppy_disk_csv extends haxe.io.Bytes {}
@:keep @:file("assets/data/scene002/002_drawer1b.csv") @:noCompletion #if display private #end class __ASSET__assets_data_scene002_002_drawer1b_csv extends haxe.io.Bytes {}
@:keep @:image("assets/data/scene002/blue_key.png") @:noCompletion #if display private #end class __ASSET__assets_data_scene002_blue_key_png extends lime.graphics.Image {}
@:keep @:file("assets/data/scene002/002_blue_key.csv") @:noCompletion #if display private #end class __ASSET__assets_data_scene002_002_blue_key_csv extends haxe.io.Bytes {}
@:keep @:file("assets/data/scene002/002_drawer1a.csv") @:noCompletion #if display private #end class __ASSET__assets_data_scene002_002_drawer1a_csv extends haxe.io.Bytes {}
@:keep @:image("assets/data/scene002/hidden.png") @:noCompletion #if display private #end class __ASSET__assets_data_scene002_hidden_png extends lime.graphics.Image {}
@:keep @:image("assets/data/scene002/floppy_disk.png") @:noCompletion #if display private #end class __ASSET__assets_data_scene002_floppy_disk_png extends lime.graphics.Image {}
@:keep @:file("assets/data/scene002/layout.xml") @:noCompletion #if display private #end class __ASSET__assets_data_scene002_layout_xml extends haxe.io.Bytes {}
@:keep @:file("assets/data/scene002/002_jump004.csv") @:noCompletion #if display private #end class __ASSET__assets_data_scene002_002_jump004_csv extends haxe.io.Bytes {}
@:keep @:file("assets/data/scene002/002_jump001.csv") @:noCompletion #if display private #end class __ASSET__assets_data_scene002_002_jump001_csv extends haxe.io.Bytes {}
@:keep @:file("assets/data/scene002/002_pic_input.csv") @:noCompletion #if display private #end class __ASSET__assets_data_scene002_002_pic_input_csv extends haxe.io.Bytes {}
@:keep @:image("assets/data/scene002/pic_input.png") @:noCompletion #if display private #end class __ASSET__assets_data_scene002_pic_input_png extends lime.graphics.Image {}
@:keep @:file("assets/data/scene002/002_drawer2a.csv") @:noCompletion #if display private #end class __ASSET__assets_data_scene002_002_drawer2a_csv extends haxe.io.Bytes {}
@:keep @:image("assets/data/scene002/glass.png") @:noCompletion #if display private #end class __ASSET__assets_data_scene002_glass_png extends lime.graphics.Image {}
@:keep @:file("assets/data/scene002/002_drawer2b.csv") @:noCompletion #if display private #end class __ASSET__assets_data_scene002_002_drawer2b_csv extends haxe.io.Bytes {}
@:keep @:image("assets/data/scene002/unlocked.png") @:noCompletion #if display private #end class __ASSET__assets_data_scene002_unlocked_png extends lime.graphics.Image {}
@:keep @:image("assets/data/scene002/green_key.png") @:noCompletion #if display private #end class __ASSET__assets_data_scene002_green_key_png extends lime.graphics.Image {}
@:keep @:file("assets/data/scene002/002_green_key.csv") @:noCompletion #if display private #end class __ASSET__assets_data_scene002_002_green_key_csv extends haxe.io.Bytes {}
@:keep @:file("assets/data/scene002/002_glass.csv") @:noCompletion #if display private #end class __ASSET__assets_data_scene002_002_glass_csv extends haxe.io.Bytes {}
@:keep @:image("assets/data/scene002/bg.png") @:noCompletion #if display private #end class __ASSET__assets_data_scene002_bg_png extends lime.graphics.Image {}
@:keep @:file("/usr/local/lib/haxe/lib/flixel/4,6,2/assets/sounds/flixel.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends haxe.io.Bytes {}
@:keep @:file("/usr/local/lib/haxe/lib/flixel/4,6,2/assets/sounds/beep.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends haxe.io.Bytes {}
@:keep @:file("/usr/local/lib/haxe/lib/flixel/4,6,2/assets/sounds/beep.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends haxe.io.Bytes {}
@:keep @:file("/usr/local/lib/haxe/lib/flixel/4,6,2/assets/sounds/flixel.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends haxe.io.Bytes {}
@:keep @:font("export/html5/obj/webfont/nokiafc22.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font {}
@:keep @:font("export/html5/obj/webfont/monsterrat.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font {}
@:keep @:image("/usr/local/lib/haxe/lib/flixel/4,6,2/assets/images/ui/button.png") @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends lime.graphics.Image {}
@:keep @:image("/usr/local/lib/haxe/lib/flixel/4,6,2/assets/images/logo/default.png") @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends lime.graphics.Image {}
@:keep @:file("") @:noCompletion #if display private #end class __ASSET__manifest_default_json extends haxe.io.Bytes {}



#else

@:keep @:expose('__ASSET__assets_fonts_pixelmplus12_regular_ttf') @:noCompletion #if display private #end class __ASSET__assets_fonts_pixelmplus12_regular_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "assets/fonts/PixelMplus12-Regular"; #else ascender = 884; descender = -200; height = 1084; numGlyphs = 7253; underlinePosition = -150; underlineThickness = 50; unitsPerEM = 1000; #end name = "PixelMplus12 Regular"; super (); }}
@:keep @:expose('__ASSET__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/nokiafc22"; #else ascender = 2048; descender = -512; height = 2816; numGlyphs = 172; underlinePosition = -640; underlineThickness = 256; unitsPerEM = 2048; #end name = "Nokia Cellphone FC Small"; super (); }}
@:keep @:expose('__ASSET__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/monsterrat"; #else ascender = 968; descender = -251; height = 1219; numGlyphs = 263; underlinePosition = -150; underlineThickness = 50; unitsPerEM = 1000; #end name = "Monsterrat"; super (); }}


#end

#if (openfl && !flash)

#if html5
@:keep @:expose('__ASSET__OPENFL__assets_fonts_pixelmplus12_regular_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_pixelmplus12_regular_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_pixelmplus12_regular_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#else
@:keep @:expose('__ASSET__OPENFL__assets_fonts_pixelmplus12_regular_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__assets_fonts_pixelmplus12_regular_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__assets_fonts_pixelmplus12_regular_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#end

#end
#end

#end
