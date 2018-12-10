extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	$MainContainer/Options/Category.add_item("AudioVideo")
	$MainContainer/Options/Category.add_item("Audio")
	$MainContainer/Options/Category.add_item("Video")
	$MainContainer/Options/Category.add_item("Development")
	$MainContainer/Options/Category.add_item("Education")
	$MainContainer/Options/Category.add_item("Game")
	$MainContainer/Options/Category.add_item("Graphics")
	$MainContainer/Options/Category.add_item("Network")
	$MainContainer/Options/Category.add_item("Office")
	$MainContainer/Options/Category.add_item("Science")
	$MainContainer/Options/Category.add_item("Settings")
	$MainContainer/Options/Category.add_item("System")
	$MainContainer/Options/Category.add_item("Utility")
	
	$MainContainer/Options/Type.add_item("Desktop")
	$MainContainer/Options/Type.add_item("Menu")
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Button_pressed():
	var CatSelect = $MainContainer/Options/Category.selected
	var TypeSelect = $MainContainer/Options/Type.selected
	
	var CatText = $MainContainer/Options/Category.get_item_text(CatSelect)
	
	var Name = $MainContainer/Options/Name.text
	var Desc = $MainContainer/Options/Desc.text
	var Icon = $MainContainer/Options/Icon.text
	var Cmd = $MainContainer/Options/Cmd.text
	
	var FileText = ""
	
	FileText += "[Desktop Entry]\n"
	FileText += "Version=1.0\n"
	FileText += "Type=Application\n"
	FileText += "Name=" + Name + "\n"
	FileText += "Comment=" + Desc + "\n"
	FileText += "Exec=" + Cmd + "\n"
	FileText += "Icon="+ Icon + "\n"
	FileText += "Path=~\n"
	FileText += "Terminal=false\n"
	FileText += "StartupNotify=false\n"
	FileText += "Categories=" + CatText + "\n"
	
	var SavePath
	
	if (TypeSelect):
		#Menu
		SavePath = OS.get_environment("HOME")
		SavePath += "/.local/share/applications/" + Name + ".desktop"
		pass
	else:
		#Desktop
		SavePath = OS.get_system_dir(0)
		SavePath += "/" + Name + ".desktop"
		pass
	
	
	var DesktopFile = File.new()
	DesktopFile.open(SavePath, File.WRITE)
	
	DesktopFile.store_string(FileText)
	DesktopFile.close()
	
	$MainContainer/Options/Saved.show()
	
	pass # replace with function body
