Add-Type -TypeDefinition @"
    using System;
    using System.Runtime.InteropServices;

    public class MouseInput {
        [DllImport("user32.dll",CharSet=CharSet.Auto, CallingConvention=CallingConvention.StdCall)]
        public static extern void mouse_event(long dwFlags, long dx, long dy, long cButtons, long dwExtraInfo);

        public const int MOUSEEVENTF_LEFTDOWN = 0x02;
        public const int MOUSEEVENTF_LEFTUP = 0x04;

        public static void ClickLeftMouseButton() {
            mouse_event(MOUSEEVENTF_LEFTDOWN | MOUSEEVENTF_LEFTUP, 0, 0, 0, 0);
        }
    }
"@

$delay = 500
$i = 0
while($i -eq 0)
{
    [MouseInput]::ClickLeftMouseButton()
    Start-Sleep -Milliseconds $delay
}
