## Short explanation for configuring mpd and ncmpcpp (...with an external USB sound card)

files:
 - /etc/mpd.conf
 - ~/.ncmpcpp/config 

### Error analysis
If mpd works fine, you won't need this. I was looking a bit why I couldn't get it to playback the songs I wanted via ncmpcpp. 
If you're facing errors, I recommend running mpd in debug mode that is, logging everything to stdout
```bash
mpd -v --no-daemon --stdout
```
That way I found out my playback issues were due to wrong audio_output device

### Step by step
Install ncmpcpp and mpd

If you've got a special audio setting (and having an external sound card does count) do `aplay -l` to determine which device you want to use.

In my case it would show me

```bash
card 2: Device [USB Audio Device], device 0: USB Audio [USB Audio]
  Subdevices: 0/1
  Subdevice #0: subdevice #0
```

Knowing it's card 2 you can proceed to modify the section `audio_output` of your /etc/mpd.conf:

```bash
audio_output {
    type		"alsa"
    name		"USB Audio Device"
    device		"hw:2,0"
}
```

For the rest just adjust the mpd.conf and .ncmpcpp/config to your liking.

#### Creating the mpd specific files and folders
```bash
mkdir ~/.mpd/
touch ~/.mpd/db_file 
touch ~/.mpd/mpd.log 
touch ~/.mpd/pid 
touch ~/.mpd/sticker.sql
```
