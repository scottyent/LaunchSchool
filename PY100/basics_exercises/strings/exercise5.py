# Write code that checks whether the string char_sequence
# contains the character x.

char_sequence = 'TXkgaG92ZXJjcmFmdCBpcyBmdWxsIG9mIGVlbHMu'

print('x' in char_sequence)

print(True if char_sequence.find('x') else False)
