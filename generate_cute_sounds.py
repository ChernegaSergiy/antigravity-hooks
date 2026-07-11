import wave
import struct
import math
import os

def generate_tone(filename, frequencies, duration_ms, volume=0.3):
    sample_rate = 44100
    
    with wave.open(filename, 'w') as f:
        f.setnchannels(1) # mono
        f.setsampwidth(2) # 16-bit
        f.setframerate(sample_rate)
        
        for freq in frequencies:
            num_samples = int(sample_rate * (duration_ms / 1000.0))
            for i in range(num_samples):
                # Apply a simple envelope (fade out) to make it sound cute and not harsh
                envelope = 1.0 - (i / num_samples)
                value = int(volume * envelope * 32767.0 * math.sin(2.0 * math.pi * freq * i / sample_rate))
                data = struct.pack('<h', value)
                f.writeframesraw(data)

os.makedirs('/home/serhii/.gemini/antigravity-cli/plugins/walle-sounds/sounds', exist_ok=True)

# Cute "thinking" sound - short double high pitched blips
generate_tone('/home/serhii/.gemini/antigravity-cli/plugins/walle-sounds/sounds/cute_think.wav', [1200, 1500], 100, 0.2)

# Cute "done" sound - an ascending happy chirp
generate_tone('/home/serhii/.gemini/antigravity-cli/plugins/walle-sounds/sounds/cute_done.wav', [800, 1000, 1500, 2000], 150, 0.2)

print("Cute sounds generated successfully!")
