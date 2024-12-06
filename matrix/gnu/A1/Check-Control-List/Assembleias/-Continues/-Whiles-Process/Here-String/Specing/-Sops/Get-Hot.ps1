#!/home/admin/app/PowerShell/Members

# Get Hot Servers from AD (Active Directory)
$servers = Get-ADComputer -Filter "OperatingSystem -eq 'Windows Server 2012 R2'"

# Loop through each server
foreach ($server in $servers) {
    # Get the server name
    $serverName = $server.Name

    # Check if the server is running
    if ($server.OperatingSystemStatus -eq 'Running') {
        # Get the server's CPU usage
        $cpuUsage = Get-WmiObject -Class Win32_Processor -Filter "DeviceID='$serverName'" | Measure-Object -Property LoadPercentage -Average

        # Check if the CPU usage exceeds 90%
        if ($cpuUsage.Average -gt 90) {
            # Send an alert email to the administrator
            $body = "The server $serverName has a high CPU usage of $($cpuUsage.Average)%."
            $subject = "High CPU Usage Alert on Server $serverName"
            $to = "admin@example.com"
            $smtpServer = "smtp.example.com"
            $credentials = New-Object System.Management.Automation.PSCredential ("admin@example.com", (ConvertTo-SecureString -AsPlainText "password" -Force))
            Send-MailMessage -From "alert@example.com" -To $to -Subject $subject -Body $body -SmtpServer $smtpServer -Credential $credentials
        }
        else {
            Write-Host "Server $serverName is running with a low CPU usage."
        }
    }
    else {
        Write-Host "Server $serverName is not running."
    }
}

$pop = @"
cpudist-bpfcc - 206061
In file included from <built-in>:2:
In file included from /virtual/include/bcc/bpf.h:12:
In file included from include/linux/types.h:6:
In file included from include/uapi/linux/types.h:14:
In file included from include/uapi/linux/posix_types.h:5:
In file included from include/linux/stddef.h:5:
In file included from include/uapi/linux/stddef.h:5:
In file included from include/linux/compiler_types.h:148:
include/linux/compiler-clang.h:45:9: warning: '__HAVE_BUILTIN_BSWAP32__' macro redefined [-Wmacro-redefined]
#define __HAVE_BUILTIN_BSWAP32__
        ^
<command line>:4:9: note: previous definition is here
#define __HAVE_BUILTIN_BSWAP32__ 1
        ^
In file included from <built-in>:2:
In file included from /virtual/include/bcc/bpf.h:12:
In file included from include/linux/types.h:6:
In file included from include/uapi/linux/types.h:14:
In file included from include/uapi/linux/posix_types.h:5:
In file included from include/linux/stddef.h:5:
In file included from include/uapi/linux/stddef.h:5:
In file included from include/linux/compiler_types.h:148:
include/linux/compiler-clang.h:46:9: warning: '__HAVE_BUILTIN_BSWAP64__' macro redefined [-Wmacro-redefined]
#define __HAVE_BUILTIN_BSWAP64__
        ^
<command line>:5:9: note: previous definition is here
#define __HAVE_BUILTIN_BSWAP64__ 1
        ^
In file included from <built-in>:2:
In file included from /virtual/include/bcc/bpf.h:12:
In file included from include/linux/types.h:6:
In file included from include/uapi/linux/types.h:14:
In file included from include/uapi/linux/posix_types.h:5:
In file included from include/linux/stddef.h:5:
In file included from include/uapi/linux/stddef.h:5:
In file included from include/linux/compiler_types.h:148:
include/linux/compiler-clang.h:47:9: warning: '__HAVE_BUILTIN_BSWAP16__' macro redefined [-Wmacro-redefined]
#define __HAVE_BUILTIN_BSWAP16__
        ^
<command line>:3:9: note: previous definition is here
#define __HAVE_BUILTIN_BSWAP16__ 1
        ^
In file included from /virtual/main.c:1:
In file included from include/uapi/linux/ptrace.h:183:
In file included from arch/x86/include/asm/ptrace.h:175:
In file included from arch/x86/include/asm/paravirt_types.h:12:
In file included from arch/x86/include/asm/nospec-branch.h:15:
arch/x86/include/asm/current.h:47:10: warning: multiple identical address spaces specified for type [-Wduplicate-decl-specifier]
                return this_cpu_read_const(const_pcpu_hot.current_task);
                       ^
arch/x86/include/asm/percpu.h:471:34: note: expanded from macro 'this_cpu_read_const'
#define this_cpu_read_const(pcp)        __raw_cpu_read(, pcp)
                                        ^
arch/x86/include/asm/percpu.h:441:30: note: expanded from macro '__raw_cpu_read'
        *(qual __my_cpu_type(pcp) *)__my_cpu_ptr(&(pcp));               \
                                    ^
arch/x86/include/asm/percpu.h:105:28: note: expanded from macro '__my_cpu_ptr'
#define __my_cpu_ptr(ptr)       (__my_cpu_type(*ptr)*)(__force uintptr_t)(ptr)
                                 ^
arch/x86/include/asm/percpu.h:104:40: note: expanded from macro '__my_cpu_type'
#define __my_cpu_type(var)      typeof(var) __percpu_seg_override
                                            ^
arch/x86/include/asm/percpu.h:45:31: note: expanded from macro '__percpu_seg_override'
#define __percpu_seg_override   __seg_gs
                                ^
<built-in>:309:33: note: expanded from here
#define __seg_gs __attribute__((address_space(256)))
                                ^
In file included from /virtual/main.c:1:
In file included from include/uapi/linux/ptrace.h:183:
In file included from arch/x86/include/asm/ptrace.h:175:
In file included from arch/x86/include/asm/paravirt_types.h:12:
In file included from arch/x86/include/asm/nospec-branch.h:15:
arch/x86/include/asm/current.h:47:10: warning: multiple identical address spaces specified for type [-Wduplicate-decl-specifier]
arch/x86/include/asm/percpu.h:471:34: note: expanded from macro 'this_cpu_read_const'
#define this_cpu_read_const(pcp)        __raw_cpu_read(, pcp)
                                        ^
arch/x86/include/asm/percpu.h:441:9: note: expanded from macro '__raw_cpu_read'
        *(qual __my_cpu_type(pcp) *)__my_cpu_ptr(&(pcp));               \
               ^
arch/x86/include/asm/percpu.h:104:40: note: expanded from macro '__my_cpu_type'
#define __my_cpu_type(var)      typeof(var) __percpu_seg_override
                                            ^
arch/x86/include/asm/percpu.h:45:31: note: expanded from macro '__percpu_seg_override'
#define __percpu_seg_override   __seg_gs
                                ^
<built-in>:309:33: note: expanded from here
#define __seg_gs __attribute__((address_space(256)))
                                ^
In file included from /virtual/main.c:2:
In file included from include/linux/sched.h:13:
arch/x86/include/asm/processor.h:529:10: warning: multiple identical address spaces specified for type [-Wduplicate-decl-specifier]
                return this_cpu_read_const(const_pcpu_hot.top_of_stack);
                       ^
arch/x86/include/asm/percpu.h:471:34: note: expanded from macro 'this_cpu_read_const'
#define this_cpu_read_const(pcp)        __raw_cpu_read(, pcp)
                                        ^
arch/x86/include/asm/percpu.h:441:30: note: expanded from macro '__raw_cpu_read'
        *(qual __my_cpu_type(pcp) *)__my_cpu_ptr(&(pcp));               \
                                    ^
arch/x86/include/asm/percpu.h:105:28: note: expanded from macro '__my_cpu_ptr'
#define __my_cpu_ptr(ptr)       (__my_cpu_type(*ptr)*)(__force uintptr_t)(ptr)
                                 ^
arch/x86/include/asm/percpu.h:104:40: note: expanded from macro '__my_cpu_type'
#define __my_cpu_type(var)      typeof(var) __percpu_seg_override
                                            ^
arch/x86/include/asm/percpu.h:45:31: note: expanded from macro '__percpu_seg_override'
#define __percpu_seg_override   __seg_gs
                                ^
<built-in>:309:33: note: expanded from here
#define __seg_gs __attribute__((address_space(256)))
                                ^
In file included from /virtual/main.c:2:
In file included from include/linux/sched.h:13:
arch/x86/include/asm/processor.h:529:10: warning: multiple identical address spaces specified for type [-Wduplicate-decl-specifier]
arch/x86/include/asm/percpu.h:471:34: note: expanded from macro 'this_cpu_read_const'
#define this_cpu_read_const(pcp)        __raw_cpu_read(, pcp)
                                        ^
arch/x86/include/asm/percpu.h:441:9: note: expanded from macro '__raw_cpu_read'
        *(qual __my_cpu_type(pcp) *)__my_cpu_ptr(&(pcp));               \
               ^
arch/x86/include/asm/percpu.h:104:40: note: expanded from macro '__my_cpu_type'
#define __my_cpu_type(var)      typeof(var) __percpu_seg_override
                                            ^
arch/x86/include/asm/percpu.h:45:31: note: expanded from macro '__percpu_seg_override'
#define __percpu_seg_override   __seg_gs
                                ^
<built-in>:309:33: note: expanded from here
#define __seg_gs __attribute__((address_space(256)))
                                ^
/virtual/main.c:48:15: error: no member named 'state' in 'struct task_struct'; did you mean 'stats'?
    if (prev->state == TASK_RUNNING) {
              ^~~~~
              stats
include/linux/sched.h:826:34: note: 'stats' declared here
        struct sched_statistics         stats;
                                        ^
/virtual/main.c:48:21: error: invalid operands to binary expression ('struct sched_statistics' and 'int')
    if (prev->state == TASK_RUNNING) {
        ~~~~~~~~~~~ ^  ~~~~~~~~~~~~
7 warnings and 2 errors generated.
Traceback (most recent call last):
  File "/usr/sbin/cpudist-bpfcc", line 161, in <module>
    b = BPF(text=bpf_text, cflags=["-DMAX_PID=%d" % max_pid])
  File "/usr/lib/python3/dist-packages/bcc/__init__.py", line 364, in __init__
    raise Exception("Failed to compile BPF module %s" % (src_file or "<text>"))
Exception: Failed to compile BPF module <text
"@
Write-Debug -Message "BPF program compilation failed: $_.Exception.Message $pop"
Stop-Transcript
