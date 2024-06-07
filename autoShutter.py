import os
import sys
import tkinter as tk
from tkinter import ttk
from PIL import Image, ImageTk
import subprocess
from threading import Thread

def resource_path(relative_path):
    if getattr(sys, 'frozen', False):
        # we are running in a bundle
        base_path = sys._MEIPASS
    else:
        # we are running in a normal Python environment
        base_path = os.path.abspath(".")
    return os.path.join(base_path, relative_path)

def start_scan():
    disable_button()
    selected_value = dropdown_value.get()
    scan_thread = Thread(target=run_applescript, args=(selected_value,))
    scan_thread.start()

def run_applescript(selected_value):
    script_path = resource_path(os.path.join('AppleScripts', 'AutoShutter.applescript'))
    subprocess.run(['osascript', script_path, selected_value])
    root.after(0, enable_button)
    play_notification_sound()

def disable_button():
    scan_button.config(state=tk.DISABLED, text="Scanning...")

def enable_button():
    scan_button.config(state=tk.NORMAL, text="Start Scan")

def play_notification_sound():
    subprocess.run(['afplay', '/System/Library/Sounds/Glass.aiff'])

# Create the main application window
root = tk.Tk()
root.title("iPhone Scanner")

# Load and display the PNG image at the top and center it
img_path = resource_path(os.path.join('icons', 'icon.png'))
img = Image.open(img_path)
img = img.resize((100, 100), Image.LANCZOS)
img = ImageTk.PhotoImage(img)
img_label = tk.Label(root, image=img)
img_label.pack(pady=10)

# Create a frame for the dropdown menu and its label
dropdown_frame = tk.Frame(root)
dropdown_frame.pack(pady=5)

# Create a label for the dropdown menu
dropdown_label = tk.Label(dropdown_frame, text="Select Option:")
dropdown_label.pack(side=tk.LEFT, padx=5)

# Create a variable to store the dropdown selection
dropdown_value = tk.StringVar(root)
dropdown_value.set("25") 

# Create a dropdown menu
dropdown_menu = ttk.OptionMenu(dropdown_frame, dropdown_value, "25", "25", "50", "75", "100")
dropdown_menu.pack(side=tk.LEFT, padx=5)

# Create a button to start the scan
scan_button = tk.Button(root, text="Start Scan", command=start_scan)
scan_button.pack(pady=20)

# Run the application
root.mainloop()
