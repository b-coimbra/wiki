require 'fiddle/import'
#
# KING SABRI | @KINGSABRI
#
if ARGV.size == 2
  lpfilename  = ARGV[0] # Library Name
  lpprocname  = ARGV[1] # Function Name
else
  puts "ruby arwin.rb <Library Name> <Function Name>"
  puts "example:\n arwin.rb user32.dll MessageBoxA"
  exit 0
end


module Kernel32

  # Extend this module to an importer
  extend Fiddle::Importer
  # Load 'user32' dynamic library into this importer
  dlload 'kernel32'

  # HMODULE WINAPI LoadLibrary(
  #   _In_ LPCTSTR lpFileName
  # );
  typealias 'lpfilename', 'char*'
  extern 'unsigned char* LoadLibrary(lpfilename)'

  # FARPROC WINAPI GetProcAddress(
  #   _In_ HMODULE hModule,
  #   _In_ LPCSTR  lpProcName
  # );
  typealias 'lpfilename', 'char*'
  typealias 'lpprocname', 'char*'
  extern 'unsigned char* GetProcAddress(lpfilename, lpprocname)'

end
address = Kernel32::GetProcAddress(Kernel32::LoadLibrary(lpfilename), lpprocname).inspect.scan(/0x[\h]+/i)[1]
unless address.hex.zero?
  puts "\n[+] #{lpprocname} is location at #{address} in #{lpfilename}\n"
else
  puts "[!] Could find #{lpprocname} in #{lpfilename}!"
  puts "[-] Function's name is case sensitive"
end