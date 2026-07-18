extends Control

## slinder_indexes:
## 1 = Size
## 2 = Speed
## 3 = Gravity
## 4 = ?
func enable_slider(slider_index:int, enabled:=true):
	$MarginContainer/ScalingPanel.enable_slider(slider_index, enabled)
