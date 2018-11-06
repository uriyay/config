'''
Places hook for numbers to be displayed as hex values.
Installtion:
    1. Copy the file into ~/.ipython/profile_default/startup directory
    2. Open ipython :)
'''

original_display = {}

def display_callback(n, p, cycle):
    p.text('dec: %d, hex: 0x%08x, bin: %s' % (n, n, bin(n)))

def enable_display_hook():
    '''To print ints as hex, run hexon_ipython().
    To revert, run disable_display_hook().
    '''
    formatter = get_ipython().display_formatter.formatters['text/plain']
    original_display[int] = formatter.for_type(int)
    formatter.for_type(int, display_callback)
    try:
        original_display[long] = formatter.for_type(long)
        formatter.for_type(long, display_callback)
    except NameError:
        #no 'long' type in python3
        pass


def disable_display_hook():
    '''See documentation for hexon_ipython().'''
    formatter = get_ipython().display_formatter.formatters['text/plain']
    formatter.for_type(int, original_display.get(int))
    try:
        formatter.for_type(long, original_display.get(long))
    except NameError:
        pass

enable_display_hook()
