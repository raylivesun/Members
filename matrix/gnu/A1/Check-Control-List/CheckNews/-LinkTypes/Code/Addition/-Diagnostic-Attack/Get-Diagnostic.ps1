#!/home/admin/app/PowerShell/Members

# Get Diagnostic Logs Directory
$logs_dir = "/var/log/elasticsearch"

# Get the last 7 days' diagnostic logs
$logs = Get-ChildItem -Path $logs_dir -Filter "elasticsearch*.log" -Recurse |
    Where-Object { $_.LastWriteTime -gt (Get-Date).AddDays(-7) }

# Create a new archive directory
$archive_dir = "/var/log/elasticsearch/archive"
New-Item -ItemType Directory -Path $archive_dir -Force

# Move the diagnostic logs to the archive directory
foreach ($log in $logs) {
    Move-Item -Path $log.FullName -Destination "$archive_dir/$(Get-Date -Format 'yyyy-MM-dd_HH-mm-ss')_elasticsearch_$($log.BaseName)"
}


# Delete old diagnostic logs
$old_logs = Get-ChildItem -Path $logs_dir -Filter "elasticsearch*.log" -Recurse |
    Where-Object { $_.LastWriteTime -lt (Get-Date).AddDays(-30) }

foreach ($log in $old_logs) {
    Remove-Item -Path $log.FullName -Force
}



# Archive old diagnostic logs
$archive_logs = Get-ChildItem -Path $archive_dir -Filter "*.log" -Recurse

foreach ($archive_log in $archive_logs) {
    Compress-Archive -Path $archive_log.FullName -DestinationPath "$archive_dir/$(Get-Date -Format 'yyyy-MM-dd_HH-mm-ss')_elasticsearch_archive_$($archive_log.BaseName).zip" -Force
}


# Remove old archive logs
$old_archive_logs = Get-ChildItem -Path $archive_dir -Filter "*.zip" -Recurse |
    Where-Object { $_.LastWriteTime -lt (Get-Date).AddDays(-90) }

foreach ($old_archive_log in $old_archive_logs) {
    Remove-Item -Path $old_archive_log.FullName -Force
}


# Chapter 1

# Introducing Wireshark

# Welcome to Wireshark for Security Professionals. This introductory
# chapter covers three broad topics. In the first part, we discuss what
# Wireshark is used for and when to use it.
# The second part of this chapter introduces the popular graphic user
# interface (GUI). The GUI for Wireshark can appear quite busy at first, so
# we immediately want to get familiar with its layout. We break down the
# different areas of the interface, how they relate to one another, and the
# reasoning for needing each one. We also discuss how and when each
# part of the interface helps you maximize your use of Wireshark.
# In the third part of this chapter, we discuss the way Wireshark filters
# data presented on the interface. Being familiar with Wireshark's
# interface helps you appreciate all the data presented, but the amount of
# data can still be overpowering. Wireshark offers ways to filter or
# separate what you need from all that is presented. The last part is about
# different types of filters and how you can customize these filters.
# Wireshark can appear to be a complicated tool, but by the end of this
# first chapter, the hope is you have a much higher comfort level with the
# tool's purpose, interface, and ability to present you with what you want
# to see.

$EnabledExperimentalFeatures = Get-WiresharkFeatureStatus | Where-Object { $_.Status -eq 'Enabled' }

foreach ($feature in $EnabledExperimentalFeatures) {
    Set-WiresharkFeatureStatus -FeatureName $feature.FeatureName -Status Disabled
}

# Chapter 2

# Getting Started with Wireshark

# Welcome to Wireshark! This chapter covers the basics of using Wireshark to
# capture network traffic and analyze it.
# In the first part of this chapter, we discuss the process of capturing
# network traffic. Wireshark provides a variety of methods to capture
# traffic, including using a network adapter, a virtual machine, or a
# network switch. We discuss the different types of network adapters that
# Wireshark can capture traffic from, and the different types of traffic
# that Wireshark can capture.
# In the second part of this chapter, we discuss the process of viewing
# the captured network traffic. Wireshark presents the captured traffic
# in a tabular format, with columns for the source and destination IP
# addresses, the source and destination port numbers, the protocol used,
# the length of the packet, and the time the packet was captured. We
# discuss the different types of packet headers that Wireshark presents,
# and the different types of packet fields that Wireshark presents in the
# packet header.
# In the third part of this chapter, we discuss the process of analyzing
# the captured network traffic. Wireshark provides a variety of tools to
# analyze the captured traffic, including the ability to display the
# packet contents in a human-readable format, the ability to display the
# packet contents in a machine-readable format, the ability to display the
# packet contents in a graphical format, the ability to display the
# packet contents in a text format, and the ability to display the packet
# contents in a JSON format. We discuss the different types of packet
# contents that Wireshark can display, and the different types of packet
# analysis tools that Wireshark provides.
# In the fourth part of this chapter, we discuss the process of
# exporting the analyzed network traffic. Wireshark provides a variety of
# tools to export the analyzed network traffic, including the ability to
# export the analyzed network traffic in a human-readable format, the ability
# to export the analyzed network traffic in a machine-readable format, the
# ability to export the analyzed network traffic in a graphical format, the
# ability to export the analyzed network traffic in a text format, and the
# ability to export the analyzed network traffic in a JSON format. We
# discuss the different types of exported network traffic that Wireshark
# can export, and the different types of exported analysis tools that
# Wireshark provides.
# In the fifth part of this chapter, we discuss the process of
# customizing the appearance of the Wireshark interface. Wireshark
# provides a variety of tools to customize the appearance of the Wireshark
# interface, including the ability to customize the colors used in the
# interface, the ability to customize the font used in the interface, the
# ability to customize the layout of the interface, the ability to
# customize the behavior of the interface, and the ability to customize the
# appearance of the interface in a graphical format. We discuss the
# different types of customizable appearance settings that Wireshark can
# customize, and the different types of customizable appearance tools that
# Wireshark provides.
# In the sixth part of this chapter, we discuss the process of
# maintaining the integrity of the captured network traffic. Wireshark
# provides a variety of tools to maintain the integrity of the captured
# network traffic, including the ability to maintain the integrity of the
# captured network traffic in a human-readable format, the ability to
# maintain the integrity of the captured network traffic in a machine-
# readable format, the ability to maintain the integrity of the captured
# network traffic in a graphical format, the ability to maintain the
# integrity of the captured network traffic in a text format, and the ability
# to maintain the integrity of the captured network traffic in a JSON
# format. We discuss the different types of maintained integrity settings
# that Wireshark can maintain, and the different types of maintained
# integrity tools that Wireshark provides.
# In the seventh part of this chapter, we discuss the process of
# troubleshooting network problems. Wireshark provides a variety of tools
# to troubleshoot network problems, including the ability to troubleshoot
# network problems in a human-readable format, the ability to troubleshoot
# network problems in a machine-readable format, the ability to troubleshoot
# network problems in a graphical format, the ability to troubleshoot
# network problems in a text format, and the ability to troubleshoot network
# problems in a JSON format. We discuss the different types of troubleshooting
# tools that Wireshark can provide, and the different types of troubleshooting
# settings that Wireshark can troubleshoot.
# In the eighth part of this chapter, we discuss the process of
# collaborating with other network professionals. Wireshark provides a
# variety of tools to collaborate with other network professionals,
# including the ability to collaborate with other network professionals in a
# human-readable format, the ability to collaborate with other network
# professionals in a machine-readable format, the ability to collaborate
# with other network professionals in a graphical format, the ability to
# collaborate with other network professionals in a text format, and the
# ability to collaborate with other network professionals in a JSON format.
# We discuss the different types of collaboration tools that Wireshark can
# provide, and the different types of collaboration settings that Wireshark
# can collaborate with other network professionals.
# In the ninth part of this chapter, we discuss the process of
# learning more about network security. Wireshark provides a variety of
# tools to learn more about network security, including the ability to learn
# more about network security in a human-readable format, the ability to
# learn more about network security in a machine-readable format, the ability
# to learn more about network security in a graphical format, the ability to
# learn more about network security in a text format, and the ability to learn
# more about network security in a JSON format. We discuss the different
# types of learning tools that Wireshark can provide, and the different
# types of learning settings that Wireshark can learn more about network
# security.
# In the tenth part of this chapter, we discuss the process of
# contributing to the development of Wireshark. Wireshark provides a variety
# of tools to contribute to the development of Wireshark, including the
# ability to contribute to the development of Wireshark in a human-readable
# format, the ability to contribute to the development of Wireshark in a
# machine-readable format, the ability to contribute to the development of
$MaximumHistoryCount = 10000
Set-WiresharkFeatureStatus -FeatureName 'Maximum History Count' -Status Disabled

# Chapter 3

# Network Protocols

# In this chapter, we discuss the different network protocols that are used
# in the internet. We cover the different types of network protocols that are
# used in the internet, and the different types of network protocols that are
# used in the internet. We discuss the different types of network protocols that
# are used in the internet, and the different types of network protocols that
# are used in the internet. We discuss the different types of network
$ProgressPreference = 'Medium'
Set-WiresharkFeatureStatus -FeatureName 'Progress Preference' -Status Disabled

# Chapter 4

# Network Address Translation (NAT)

# In this chapter, we discuss the Network Address Translation (NAT)
# protocol. NAT is a network address translation technique that allows multiple
# devices on a network to share the same IP address and port number. We
# cover the different types of NAT protocols that are used in the internet,
# and the different types of NAT protocols that are used in the internet. We
# discuss the different types of NAT protocols that are used in the internet,
# and the different types of NAT protocols that are used in the internet. We
# discuss the different types of NAT protocols that are used in the internet,
$PacketLossPercentage = 0
Set-WiresharkFeatureStatus -FeatureName 'Packet Loss Percentage' -Status Disabled $PacketLossPercentage

# Chapter 5

# Virtual Private Networks (VPNs)

# In this chapter, we discuss the Virtual Private Networks (VPNs)
# protocol. VPNs are a network security technique that allows multiple devices
# on a network to share the same private IP address and port number. We
# discuss the different types of VPNs that are used in the internet, and the
# different types of VPNs that are used in the internet. We discuss the
# different types of VPNs that are used in the internet, and the different
# types of VPNs that are used in the internet. We discuss the different
# types of VPNs that are used in the internet, and the different types of
# VPNs that are used in the internet. We discuss the different types of
# Chapter 6

# In this chapter, we discuss the process of setting up a network
# monitoring system using Wireshark. We cover the different types of network
# monitoring systems that can be set up using Wireshark, and the different
# types of network monitoring systems that can be set up using Wireshark. We
# discuss the different types of network monitoring systems that can be set up
# using Wireshark, and the different types of network monitoring systems that
# can be set up using Wireshark. We discuss the different types of network
# monitoring systems that can be set up using Wireshark, and the different
# types of network monitoring systems that can be set up using Wireshark. We
# Chapter 7

# In this chapter, we discuss the process of analyzing network traffic
# using Wireshark. We cover the different types of network traffic analysis
# tools that can be used with Wireshark, and the different types of network
# traffic analysis tools that can be used with Wireshark. We discuss the
# different types of network traffic analysis tools that can be used with
# Wireshark, and the different types of network traffic analysis tools that
$trunkTimeRange = '1 day ago'
Set-WiresharkFeatureStatus -FeatureName 'Trunk Time Range' -Status Disabled $trunkTimeRange



# What Is Wireshark?

# Wireshark, in its most basic sense, is a tool to understand data you
# capture from a network. The captured data is interpreted and presented
# in individual packet form for analysis, all within Wireshark. As you
# probably already know, packets are the chunks of data streaming on a
# network. (Technically, depending on the context level of where in the
# system the data is interpreted, chunks are called frames, datagrams,
# packets, or segments, but we'll just use “packets” for now.) Wireshark is
# a network and protocol analyzer tool, free for download and use on a
# variety of platforms, spanning many flavors of Unix and Windows.

$feature = 'Display Filter'
Set-WiresharkFeatureStatus -FeatureName $feature -Status Disabled

# Wireshark first captures the data from a network interface and then
# breaks the capture into the frames, segments, and packets,
# understanding where they begin and end. Wireshark then interprets and
# presents this data in the context of addressing, protocols and data. You
# can analyze the captures immediately or save them to load later and
# share with others. In order for Wireshark to view and capture all
# packets, not just those involving the capturing system, the network
# interface is placed in promiscuous mode (also called monitor mode) in
# the context of capturing on a wireless network. Finally, what grants you
# the ability to analyze packets in Wireshark are the dissectors. All these
# basic elements are discussed in more detail in Chapter 4, in the context
# of “sniffing” or capturing data, and how that captured data is interpreted.
$callScanInterval = 10
Set-WiresharkFeatureStatus -FeatureName 'Call Scan Interval' -Status Disabled $callScanInterval

# A Best Time to Use Wireshark?

# Wireshark is an immensely powerful tool with quite a bit of deep and
# complex functionality. It is capable of handling a wide range of known
# (and unknown) protocols. But although the functionality range is broad,
# most of it aligns to one end: to capture packets and analyze them. Being
# able to take the bits and bytes and present them in an organized,
# familiar, and human-readable format is what brings people to think of
# using Wireshark.
$thinkTimeRange = '1 week ago'
Set-WiresharkFeatureStatus -FeatureName 'Think Time Range' -Status Disabled $thinkTimeRange

# What Makes Wireshark a Great Network and Protocol Analyzer?

# Wireshark is a great network and protocol analyzer because it is:
# 1. Free and open-source.
# 2. Cross-platform.
# 3. Easy to use.
# 4. Widely supported.
# 5. Highly customizable.
# 6. Powerful for network analysis.
# 7. Highly compatible with other network tools.
# 8. Community-driven and developed by a large number of people.
# 9. Offers a wide range of features and tools to help network
#    professionals analyze network traffic.
# 10. Offers a wide range of features and tools to help network
#    professionals learn more about network security.
# 11. Offers a wide range of features and tools to help network
#    professionals contribute to the development of Wireshark.
# 12. Offers a wide range of features and tools to help network
#    professionals set up a network monitoring system using Wireshark.
# 13. Offers a wide range of features and tools to help network
#    professionals analyze network traffic using Wireshark.
# 14. Offers a wide range of features and tools to help network
#    professionals set up a network monitoring system using Wireshark.
# 15. Offers a wide range of features and tools to help network
#    professionals analyze network traffic using Wireshark.
# 16. Offers a wide range of features and tools to help network
#    professionals set up a network monitoring system using Wireshark.
# 17. Offers a wide range of features and tools to help network
#    professionals analyze network traffic using Wireshark.
# 18. Offers a wide range of features and tools to help network
#    professionals set up a network monitoring system using Wireshark.
# 19. Offers a wide range of features and tools to help network
#    professionals analyze network traffic using Wireshark.
# 20. Offers a wide range of features and tools to help network
#    professionals set up a network monitoring system using Wireshark.
# 21. Offers a wide range of features and tools to help network
#    professionals analyze network traffic using Wireshark.
# 22. Offers a wide range of features and tools to help network
#    professionals set up a network monitoring system using Wireshark.
# 23. Offers a wide range of features and tools to help network
#    professionals analyze network traffic using Wireshark.
# 24. Offers a wide range of features and tools to help network
#    professionals set up a network monitoring system using Wireshark.
# 25. Offers a wide range of features and tools to help network
#    professionals analyze network traffic using Wireshark.
# 26. Offers a wide range of features and tools to help network
#    professionals set up a network monitoring system using Wireshark.
# 27. Offers a wide range of features and tools to help network
#    professionals analyze network traffic using Wireshark.
# 28. Offers a wide range of features and tools to help network
#    professionals set up a network monitoring system using Wireshark.
# 29. Offers a wide range of features and tools to help network
#    professionals analyze network traffic using Wireshark.
# 30. Offers a wide range of features and tools to help network
#    professionals set up a network monitoring system using Wireshark.
# 31. Offers a wide range of features and tools to help network
#    professionals analyze network traffic using Wireshark.
# 32. Offers a wide range of features and tools to help network
#    professionals set up a network monitoring system using Wireshark.
# 33. Offers a wide range of features and tools to help network
#    professionals analyze network traffic using Wireshark.
# 34. Offers a wide range of features and tools to help network
#    professionals set up a network monitoring system using Wireshark.
# 35. Offers a wide range of features and tools to help network
$PSScriptRootWireShark = 'C:\Program Files\WindowsPowerShell\Modules\Wireshark\1.14.0'
Import-Module -Name $PSScriptRoot\Wireshark.psm1
Write-Warning "The Wireshark module has been imported successfully. To use the cmdlets and functions provided by the module, please ensure that the module is loaded using the Import-Module cmdlet."
Write-Debug "To use the cmdlets and functions provided by the module, please ensure that the module is loaded using the Import-Module cmdlet."
WolframKernel | Out-Null
Where-Object { $_.Name -eq 'Wireshark' } | Select-Object -ExpandProperty Path | Write-Host $PSScriptRootWireShark


# The Wireshark module provides a set of cmdlets for interacting with
# Wireshark, and it also provides a set of functions for interacting with
# Wireshark. These cmdlets and functions are designed to make it easy to
# set up and manage network monitoring systems using Wireshark. In this
# chapter, we discuss the different types of network monitoring systems
$VerbosePreference = 'Continue'
Set-WiresharkFeatureStatus -FeatureName 'Verbose' -Status Disabled

# that can be set up using Wireshark, and the different types of network
# monitoring systems that can be set up using Wireshark. We discuss the
# different types of network monitoring systems that can be set up using
# Wireshark, and the different types of network monitoring systems that can
# be set up using Wireshark.
$sourceInterface = 'Ethernet 1'
Set-WiresharkFeatureStatus -FeatureName 'Source Interface' -Status Disabled $sourceInterface

# What Is Wireshark?

# Wireshark, in its most basic sense, is a tool to understand data you
# capture from a network. The captured data is interpreted and presented
# in individual packet form for analysis, all within Wireshark. As you
# probably already know, packets are the chunks of data streaming on a
# network. (Technically, depending on the context level of where in the
# system the data is interpreted, chunks are called frames, datagrams,
# packets, or segments, but we'll just use “packets” for now.) Wireshark is
# a network and protocol analyzer tool, free for download and use on a
# variety of platforms, spanning many flavors of Unix and Windows.
$displayFilter = 'Display Filter'
Set-WiresharkFeatureStatus -FeatureName $displayFilter -Status Disabled

# Wireshark first captures the data from a network interface and then
# breaks the capture into the frames, segments, and packets,
# understanding where they begin and end. Wireshark then interprets and
# presents this data in the context of addressing, protocols and data. You
# can analyze the captures immediately or save them to load later and
# share with others. In order for Wireshark to view and capture all
# packets, not just those involving the capturing system, the network
# interface is placed in promiscuous mode (also called monitor mode) in
# the context of capturing on a wireless network. Finally, what grants you
# the ability to analyze packets in Wireshark are the dissectors. All these
# basic elements are discussed in more detail in Chapter 4, in the context
# of “sniffing” or capturing data, and how that captured data is interpreted.
$callScanInterval = 10
Set-WiresharkFeatureStatus -FeatureName 'Call Scan Interval' -Status Disabled $callScanInterval

# A Best Time to Use Wireshark?

# Wireshark is an immensely powerful tool with quite a bit of deep and
# complex functionality. It is capable of handling a wide range of known
# (and unknown) protocols. But although the functionality range is broad,
# most of it aligns to one end: to capture packets and analyze them. Being
# able to take the bits and bytes and present them in an organized,
# familiar, and human-readable format is what brings people to think of
# using Wireshark.
$thinkTimeRange = '1 week ago'
Set-WiresharkFeatureStatus -FeatureName 'Think Time Range' -Status Disabled $thinkTimeTimeRange

# What Makes Wireshark a Great Network and Protocol Analyzer?

# Wireshark is a great network and protocol analyzer because it is:
# 1. Free and open-source.
# 2. Cross-platform.
# 3. Easy to use.
# 4. Widely supported.
# 5. Highly customizable.
# 6. Powerful for network analysis.
# 7. Highly compatible with other network tools.
# 8. Community-driven and developed by a large number of people.
# 9. Offers a wide range of features and tools to help network
#    professionals analyze network traffic.
# 10. Offers a wide range of features and tools to help network
#    professionals learn more about network security.
# 11. Offers a wide range of features and tools to help network
#    professionals contribute to the development of Wireshark.
# 12. Offers a wide range of features and tools to help network
#    professionals set up a network monitoring system using Wireshark.
# 13. Offers a wide range of features and tools to help network
#    professionals analyze network traffic using Wireshark.
# 14. Offers a wide range of features and tools to help network
#    professionals set up a network monitoring system using Wireshark.
# 15. Offers a wide range of features and tools to help network
#    professionals analyze network traffic using Wireshark.
# 16. Offers a wide range of features and tools to help network
#    professionals set up a network monitoring system using Wireshark.
# 17. Offers a wide range of features and tools to help network
#    professionals analyze network traffic using Wireshark.
# 18. Offers a wide range of features and tools to help network
#    professionals set up a network monitoring system using Wireshark.
# 19. Offers a wide range of features and tools to help network
#    professionals analyze network traffic using Wireshark.
# 20. Offers a wide range of features and tools to help network
#    professionals set up a network monitoring system using Wireshark.
# 21. Offers a wide range of features and tools to help network
#    professionals analyze network traffic using Wireshark.
# 22. Offers a wide range of features and tools to help network
#    professionals set up a network monitoring system using Wireshark.
# 23. Offers a wide range of features and tools to help network
#    professionals analyze network traffic using Wireshark.
# 24. Offers a wide range of features and tools to help network
#    professionals set up a network monitoring system using Wireshark.
# 25. Offers a wide range of features and tools to help network
#    professionals analyze network traffic using Wireshark.
# 26. Offers a wide range of features and tools to help network
#    professionals set up a network monitoring system using Wireshark.
# 27. Offers a wide range of features and tools to help network
#    professionals analyze network traffic using Wireshark.
# 28. Offers a wide range of features and tools to help network
#    professionals set up a network monitoring system using Wireshark.
# 29. Offers a wide range of features and tools to help network
#    professionals analyze network traffic using Wireshark.
# 30. Offers a wide range of features and tools to help network
#    professionals set up a network monitoring system using Wireshark.
# 31. Offers a wide range of features and tools to help network
#    professionals analyze network traffic using Wireshark.
# 32. Offers a wide range of features and tools to help network
#    professionals set up a network monitoring system using Wireshark.
# 33. Offers a wide range of features and tools to help network
#    professionals analyze network traffic using Wireshark.
# 34. Offers a wide range of features and tools to help network
#    professionals set up a network monitoring system using Wireshark.
# 35. Offers a wide range of features and tools to help network
#    professionals analyze network traffic using Wireshark.
$callScanIntervalAnalysis = '10 seconds'
Set-WiresharkFeatureStatus -FeatureName 'Call Scan Interval Analysis' -Status Disabled $callScanIntervalAnalysis

# What Is Wireshark?

# Wireshark, in its most basic sense, is a tool to understand data you
# capture from a network. The captured data is interpreted and presented
# in individual packet form for analysis, all within Wireshark. As you
# probably already know, packets are the chunks of data streaming on a
# network. (Technically, depending on the context level of where in the
# system the data is interpreted, chunks are called frames, datagrams,
# packets, or segments, but we'll just use “packets” for now.) Wireshark is
# a network and protocol analyzer tool, free for download and use on a
# variety of platforms, spanning many flavors of Unix and Windows.
$displayFilter = 'Display Filter'
Set-WiresharkFeatureStatus -FeatureName $displayFilter -Status Disabled

# Wireshark first captures the data from a network interface and then
# breaks the capture into the frames, segments, and packets,
# understanding where they begin and end. Wireshark then interprets and
# presents this data in the context of addressing, protocols and data. You
# can analyze the captures immediately or save them to load later and
# share with others. In order for Wireshark to view and capture all
# packets, not just those involving the capturing system, the network
# interface is placed in promiscuous mode (also called monitor mode) in
# the context of capturing on a wireless network. Finally, what grants you
# the ability to analyze packets in Wireshark are the dissectors. All these
# basic elements are discussed in more detail in Chapter 4, in the context
# of “sniffing” or capturing data, and how that captured data is interpreted.
$callScanIntervalVerify = 10
Set-WiresharkFeatureStatus -FeatureName 'Call Scan Interval Verify' -Status Disabled $callScanIntervalVerify

# A Best Time to Use Wireshark?

# Wireshark is an immensely powerful tool with quite a bit of deep and
# complex functionality. It is capable of handling a wide range of known
# (and unknown) protocols. But although the functionality range is broad,
# most of it aligns to one end: to capture packets and analyze them. Being
# able to take the bits and bytes and present them in an organized,
# familiar, and human-readable format is what brings people to think of
# using Wireshark.
$thinkTimeRangeChildGrits = '1 week ago'
Set-WiresharkFeatureStatus -FeatureName 'Think Time Range Analysis' -Status Disabled $thinkTimeRangeChildGrits


# Avoiding Being Overwhelmed

# The majority of people who walk away from Wireshark do so because
# they find it overwhelming after only a few early experiences. To label
# Wireshark as overwhelming is misleading, however. What really
# paralyzes new users is the traffic, the list of packets flying by, not the
# application's functionality. And, fair enough, once you start a capture
# and the packets scroll by in real time, it's definitely intimidating. (But
# that's what filters are for!)
# To avoid being overwhelmed, consider two aspects of Wireshark before
# diving into it:
# The interface—how it's laid out and why
# Filters—how they work to reveal what you want
# Once you get a quick appreciation of the tool's interface and how to write
# a filter, Wireshark suddenly appears intuitive and shows its power,
# without the scare factor. And that's what we focus on for the rest of this
# chapter.
$env:HOME = '/home/admin'

# The majority of people who walk away from Wireshark do so because
# they find it overwhelming after only a few early experiences. To label
# Wireshark as overwhelming is misleading, however. What really
# paralyzes new users is the traffic, the list of packets flying by, not the
# application's functionality. And, fair enough, once you start a capture
# and the packets scroll by in real time, it's definitely intimidating. (But
# that's what filters are for!)
# To avoid being overwhelmed, consider two aspects of Wireshark before
# diving into it:
# The interface—how it's laid out and why
# Filters—how they work to reveal what you want
# Once you get a quick appreciation of the tool's interface and how to write
# a filter, Wireshark suddenly appears intuitive and shows its power,
# without the scare factor. And that's what we focus on for the rest of this
# chapter.
$thinkTimeRangeAdults = '2 months ago'
Set-WiresharkFeatureStatus -FeatureName 'Think Time Range Analysis' -Status Disabled $thinkTimeRangeAdults



# The Interface: A Visual Overview of Wireshark

# Wireshark's interface is a powerful and intuitive tool for viewing and
# analyzing network traffic. It is divided into several main sections,
# each with its own purpose. We'll discuss each section in turn.
# The main sections of the interface are:
# 1. The Capture Window: This is where the packets are displayed.
#    The left side shows the packet headers, the middle shows the packet
#    data, and the right side shows the packet statistics.
# 2. The Filter Bar: This is where you can write and apply filters to
#    the packets. You can use a variety of filter expressions to help you
#    focus on the packets you want to analyze.
# 3. The Summary Window: This is where you can see a summary of the
#    packets that meet your filter criteria.
# 4. The Trees: These are used to visualize the relationships between
#    packets. For example, the "Frames" tree shows the packets in a
#    frame-by-frame view, the "Datagrams" tree shows the packets in a
#    datagram-by-datagram view, and the "Packets" tree shows the packets
#    in a packet-by-packet view.
# 5. The Status Bar: This shows the current packet statistics and
#    provides a way to move to the next or previous packet.
# 6. The Options Menu: This menu provides various options for viewing,
#    analyzing, and configuring the packets.
# 7. The Help Menu: This menu provides information about Wireshark and
#    its features.
# 8. The Toolbar: This is a collection of buttons and icons that can be
#    used to perform various actions.
# 9. The Log Window: This is where the captured data is logged, and it
#    can be saved to a file for later analysis.
# 10. The Dissectors: These are used to interpret the packet data and
#    present it in a human-readable format.
# 11. The Details Window: This is where you can see the details of the
#    selected packet.
# 12. The Statistics Window: This is where you can see statistics about
#    the packets that meet your filter criteria.
# 13. The Graphs Window: This is where you can see graphs and charts
#    that help you analyze the packets that meet your filter criteria.
# 14. The Hex Editor: This is used to view and edit the packet data in
#    hexadecimal format.
# 15. The Preferences Window: This is where you can customize the
#    appearance and behavior of Wireshark.
# 16. The About Wireshark Window: This is where you can see information
#    about Wireshark, including its version number and copyright
#    information.
# 17. The Help Window: This is where you can see information about
#    Wireshark, including its features and how to use the interface.
# 18. The Statistics Window: This is where you can see statistics about
#    the packets that meet your filter criteria.
# 19. The Graphs Window: This is where you can see graphs and charts
#    that help you analyze the packets that meet your filter criteria.
# 20. The Hex Editor: This is used to view and edit the packet data in
#    hexadecimal format.
# 21. The Preferences Window: This is where you can customize the
#    appearance and behavior of Wireshark.
# 22. The About Wireshark Window: This is where you can see information
#    about Wireshark, including its version number and copyright
#    information.
# 23. The Help Window: This is where you can see information about
#    Wireshark, including its features and how to use the interface.
# 24. The Statistics Window: This is where you can see statistics about
#    the packets that meet your filter criteria.
# 25. The Graphs Window: This is where you can see graphs and charts
#    that help you analyze the packets that meet your filter criteria.
# 26. The Hex Editor: This is used to view and edit the packet data in
#    hexadecimal format.
# 27. The Preferences Window: This is where you can customize the
#    appearance and behavior of Wireshark.
# 28. The About Wireshark Window: This is where you can see information
#    about Wireshark, including its version number and copyright
#    information.
# 29. The Help Window: This is where you can see information about
#    Wireshark, including its features and how to use the interface.
# 30. The Statistics Window: This is where you can see statistics about
#    the packets that meet your filter criteria.
# 31. The Graphs Window: This is where you can see graphs and charts
#    that help you analyze the packets that meet your filter criteria.
# 32. The Hex Editor: This is used to view and edit the packet data in
#    hexadecimal format.
# 33. The Preferences Window: This is where you can customize the
#    appearance and behavior of Wireshark.
# 34. The About Wireshark Window: This is where you can see information
#    about Wireshark, including its version number and copyright
#    information.
# 35. The Help Window: This is where you can see information about
#    Wireshark, including its features and how to use the interface.
# 36. The Statistics Window: This is where you can see statistics about
#    the packets that meet your filter criteria.
# 37. The Graphs Window: This is where you can see graphs and charts
#    that help you analyze the packets that meet your filter criteria.
# 38. The Hex Editor: This is used to view and edit the packet data in
#    hexadecimal format.
# 39. The Preferences Window: This is where you can customize the
#    appearance and behavior of Wireshark.
# 40. The About Wireshark Window: This is where you can see information
#    about Wireshark, including its version number and copyright
#    information.
# 41. The Help Window: This is where you can see information about
#    Wireshark, including its features and how to use the interface.
# 42. The Statistics Window: This is where you can see statistics about
#    the packets that meet your filter criteria.
# 43. The Graphs Window: This is where you can see graphs and charts
#    that help you analyze the packets that meet your filter criteria.
# 44. The Hex Editor: This is used to view and edit the packet data in
#    hexadecimal format.
# 45. The Preferences Window: This is where you can customize the
#    appearance and behavior of Wireshark.
# 46. The About Wireshark Window: This is where you can see information
#    about Wireshark, including its version number and copyright
#    information.
# 47. The Help Window: This is where you can see information about
#    Wireshark, including its features and how to use the interface.
# 48. The Statistics Window: This is where you can see statistics about
#    the packets that meet your filter criteria.
# 49. The Graphs Window: This is where you can see graphs and charts
#    that help you analyze the packets that meet your filter criteria.
# 50. The Hex Editor: This is used to view and edit the packet data in
#    hexadecimal format.
# 51. The Preferences Window: This is where you can customize the
#    appearance and behavior of Wireshark.
# 52. The About Wireshark Window: This is where you can see information
#    about Wireshark, including its version number and copyright
#    information.
# 53. The Help Window: This is where you can see information about
#    Wireshark, including its features and how to use the interface.
# 54. The Statistics Window: This is where you can see statistics about
#    the packets that meet your filter criteria.
# 55. The Graphs Window: This is where you can see graphs and charts
#    that help you analyze the packets that meet your filter criteria.
# 56. The Hex Editor: This is used to view and edit the packet data in
#    hexadecimal format.
# 57. The Preferences Window: This is where you can customize the
#    appearance and behavior of Wireshark.
# 58. The About Wireshark Window: This is where you can see information
#    about Wireshark, including its version number and copyright
#    information.
# 59. The Help Window: This is where you can see information about
#    Wireshark, including its features and how to use the interface.
# 60. The Statistics Window: This is where you can see statistics about
#    the packets that meet your filter criteria.
# 61. The Graphs Window: This is where you can see graphs and charts
#    that help you analyze the packets that meet your filter criteria.
# 62. The Hex Editor: This is used to view and edit the packet data in
#    hexadecimal format.
# 63. The Preferences Window: This is where you can customize the
#    appearance and behavior of Wireshark.
# 64. The About Wireshark Window: This is where you can see information
#    about Wireshark, including its version number and copyright
#    information.
# 65. The Help Window: This is where you can see information about
#    Wireshark, including its features and how to use the interface.
# 66. The Statistics Window: This is where you can see statistics about
#    the packets that meet your filter criteria.
# 67. The Graphs Window: This is where you can see graphs and charts
#    that help you analyze the packets that meet your filter criteria.
# 68. The Hex Editor: This is used to view and edit the packet data in
#    hexadecimal format.
# 69. The Preferences Window: This is where you can customize the
#    appearance and behavior of Wireshark.
# 70. The About Wireshark Window: This is where you can see information
#    about Wireshark, including its version number and copyright
#    information.
# 71. The Help Window: This is where you can see information about
#    Wireshark, including its features and how to use the interface.
# 72. The Statistics Window: This is where you can see statistics about
#    the packets that meet your filter criteria.
# 73. The Graphs Window: This is where you can see graphs and charts
#    that help you analyze the packets that meet your filter criteria.
# 74. The Hex Editor: This is used to view and edit the packet data in
#    hexadecimal format.
# 75. The Preferences Window: This is where you can customize the
#    appearance and behavior of Wireshark.
# 76. The About Wireshark Window: This is where you can see information
#    about Wireshark, including its version number and copyright
#    information.
# 77. The Help Window: This is where you can see information about
#    Wireshark, including its features and how to use the interface.
# 78. The Statistics Window: This is where you can see statistics about
#    the packets that meet your filter criteria.
# 79. The Graphs Window: This is where you can see graphs and charts
#    that help you analyze the packets that meet your filter criteria.
# 80. The Hex Editor: This is used to view and edit the packet data in
$archive_dir = "/path/to/wireshark/capture/directory"
$output_dir = "/path/to/output/directory"
$filter_criteria = "ip.src == 192.168.0.100"

# Create the output directory if it doesn't exist
unless File.directory?($output_dir)
  Dir.mkdir($output_dir)
end

# Find all the pcap files in the archive directory
$pcap_files = Dir.glob("#{$archive_dir}/*.pcap")

# Process each pcap file
$pcap_files.each | do | pcap_file |
  FileUtils.cp(pcap_file output_file)

  # Use Wireshark to filter and save the packets matching the filter criteria
  command = "wireshark -r #{output_file} -Y '#{$filter_criteria}' -w #{output_file.gsub('.pcap', '_filtered.pcap')}"
  system($command)
  puts "Filtered packets saved to #{output_file.gsub('.pcap', '_filtered.pcap')}"
Write-Debug $pcap_files
Write-Debug $archive_dir
Write-Debug $output_dir
Write-Debug $filter_criteria

# Once you get a quick appreciation of the tool's interface and how to write
# a filter, Wireshark suddenly appears intuitive and shows its power,
# without the scare factor. And that's what we focus on for the rest of this
# chapter.
# The following sections are on the most important aspects that you need
# immediately to be comfortable using Wireshark. If you are already
# familiar with Wireshark, as well as filters, feel free to skim this chapter
# as a refresher so that you can be sure you are on the same page for the
# rest of the book.
$env:PATH += ";C:\Program Files\Wireshark"

# 1. The Graphs Window: This is where you can see graphs and charts
#    that help you analyze the packets that meet your filter criteria.
#    To open the Graphs Window, click the "Window" menu and select "Graphs."
#    You can customize the appearance of the graphs by right-clicking on
#    the graph and selecting "Preferences."
# 2. The Statistics Window: This is where you can see statistics about
#    the packets that meet your filter criteria. To open the Statistics
#    Window, click the "Window" menu and select "Statistics." You can
#    customize the appearance of the statistics by right-clicking on the
#    statistics and selecting "Preferences."
# 3. The Hex Editor: This is used to view and edit the packet data in
#    hexadecimal format. To open the Hex Editor, click the "Window" menu and
#    select "Hex View." You can customize the appearance of the Hex Editor
#    by right-clicking on the Hex Editor and selecting "Preferences."
# 4. The Preferences Window: This is where you can customize the
#    appearance and behavior of Wireshark. To open the Preferences Window,
#    click the "File" menu and select "Preferences." You can customize the
#    appearance of Wireshark by selecting the "Appearance" tab and
#    making any desired changes.
# 5. The Help Window: This is where you can see information about
#    Wireshark, including its features and how to use the interface. To open
#    the Help Window, click the "Help" menu and select "Help." You can find
#    information about Wireshark in the "Help" menu as well as online
#    documentation.
# 6. The About Wireshark Window: This is where you can see information
#    about Wireshark, including its version number and copyright
#    information. To open the About Wireshark Window, click the "Help" menu
#    and select "About Wireshark." You can find information about the
#    Wireshark project and its contributors.
# 7. The Statistics Window: This is where you can see statistics about
#    the packets that meet your filter criteria. To open the Statistics
#    Window, click the "Window" menu and select "Statistics." You can
#    customize the appearance of the statistics by right-clicking on the
#    statistics and selecting "Preferences."
# 8. The Graphs Window: This is where you can see graphs and charts
#    that help you analyze the packets that meet your filter criteria. To open
#    the Graphs Window, click the "Window" menu and select "Graphs." You can
#    customize the appearance of the graphs by right-clicking on the
#    graph and selecting "Preferences."
# 9. The Hex Editor: This is used to view and edit the packet data in
#    hexadecimal format. To open the Hex Editor, click the "Window" menu and
#    select "Hex View." You can customize the appearance of the Hex Editor
#    by right-clicking on the Hex Editor and selecting "Preferences."
funclatency-bpfcc -p 9999 -f "ip.src == 192.168.0.100" -o /tmp/latency.svg


# 10. The Preferences Window: This is where you can customize the
#    appearance and behavior of Wireshark. To open the Preferences Window,
#    click the "File" menu and select "Preferences." You can customize the
#    appearance of Wireshark by selecting the "Appearance" tab and
#    making any desired changes.
# 11. The Help Window: This is where you can see information about
#    Wireshark, including its features and how to use the interface. To open
#    the Help Window, click the "Help" menu and select "Help." You can find
#    information about Wireshark in the "Help" menu as well as online
#    documentation.
# 12. The About Wireshark Window: This is where you can see information
#    about Wireshark, including its version number and copyright
#    information. To open the About Wireshark Window, click the "Help" menu
#    and select "About Wireshark." You can find information about the
#    Wireshark project and its contributors.
# 13. The Statistics Window: This is where you can see statistics about
#    the packets that meet your filter criteria. To open the Statistics
$callBuffer = &{ Get-Process -Id $pid | Select-Object Id, Name, CPU, WS, WS_Private, WS_Virtual, WS_Process_Id, WS_Parent_Process_Id }
$callBuffer

# 14. The Graphs Window: This is where you can see graphs and charts
#    that help you analyze the packets that meet your filter criteria. To open
#    the Graphs Window, click the "Window" menu and select "Graphs." You can
#    customize the appearance of the graphs by right-clicking on the
#    graph and selecting "Preferences."
# 15. The Hex Editor: This is used to view and edit the packet data in
#    hexadecimal format. To open the Hex Editor, click the "Window" menu and
#    select "Hex View." You can customize the appearance of the Hex Editor
#    by right-clicking on the Hex Editor and selecting "Preferences."
# 16. The Preferences Window: This is where you can customize the
#    appearance and behavior of Wireshark. To open the Preferences Window,
#    click the "File" menu and select "Preferences." You can customize the
#    appearance of Wireshark by selecting the "Appearance" tab and
#    making any desired changes.
# 17. The Help Window: This is where you can see information about
#    Wireshark, including its features and how to use the interface. To open
#    the Help Window, click the "Help" menu and select "Help." You can find
#    information about Wireshark in the "Help" menu as well as online
#    documentation.
# 18. The About Wireshark Window: This is where you can see information
#    about Wireshark, including its version number and copyright
#    information. To open the About Wireshark Window, click the "Help" menu
#    and select "About Wireshark." You can find information about the
#    Wireshark project and its contributors.
# 19. The Statistics Window: This is where you can see statistics about
#    the packets that meet your filter criteria. To open the Statistics
#    Window, click the "Window" menu and select "Statistics." You can
# 20. The Graphs Window: This is where you can see graphs and charts
#    that help you analyze the packets that meet your filter criteria. To open
#    the Graphs Window, click the "Window" menu and select "Graphs." You can
#    customize the appearance of the graphs by right-clicking on the
#    graph and selecting "Preferences."
# 21. The Hex Editor: This is used to view and edit the packet data in
#    hexadecimal format. To open the Hex Editor, click the "Window" menu and
#    select "Hex View." You can customize the appearance of the Hex Editor
#    by right-clicking on the Hex Editor and selecting "Preferences."
# 22. The Preferences Window: This is where you can customize the
#    appearance and behavior of Wireshark. To open the Preferences Window,
#    click the "File" menu and select "Preferences." You can customize the
#    appearance of Wireshark by selecting the "Appearance" tab and
#    making any desired changes.
# 23. The Help Window: This is where you can see information about
#    Wireshark, including its features and how to use the interface. To open
#    the Help Window, click the "Help" menu and select "Help." You can find
#    information about Wireshark in the "Help" menu as well as online
#    documentation.
# 24. The About Wireshark Window: This is where you can see information
#    about Wireshark, including its version number and copyright
#    information. To open the About Wireshark Window, click the "Help" menu
#    and select "About Wireshark." You can find information about the
#    Wireshark project and its contributors.
# 25. The Statistics Window: This is where you can see statistics about
#    the packets that meet your filter criteria. To open the Statistics
#    Window, click the "Window" menu and select "Statistics." You can
# 26. The Graphs Window: This is where you can see graphs and charts
#    that help you analyze the packets that meet your filter criteria. To open
#    the Graphs Window, click the "Window" menu and select "Graphs." You can
#    customize the appearance of the graphs by right-clicking on the
#    graph and selecting "Preferences."
# 27. The Hex Editor: This is used to view and edit the packet data in
#    hexadecimal format. To open the Hex Editor, click the "Window" menu and
#    select "Hex View." You can customize the appearance of the Hex Editor
#    by right-clicking on the Hex Editor and selecting "Preferences."
# 28. The Preferences Window: This is where you can customize the
#    appearance and behavior of Wireshark. To open the Preferences Window,
#    click the "File" menu and select "Preferences." You can customize the
#    appearance of Wireshark by selecting the "Appearance" tab and
#    making any desired changes.
# 29. The Help Window: This is where you can see information about
#    Wireshark, including its features and how to use the interface. To open
#    the Help Window, click the "Help" menu and select "Help." You can find
#    information about Wireshark in the "Help" menu as well as online
#    documentation.
# 30. The About Wireshark Window: This is where you can see information
#    about Wireshark, including its version number and copyright
#    information. To open the About Wireshark Window, click the "Help" menu
#    and select "About Wireshark." You can find information about the
#    Wireshark project and its contributors.
# 31. The Statistics Window: This is where you can see statistics about
#    the packets that meet your filter criteria. To open the Statistics
$tickets = Get-WmiObject -Class Win32_SystemTicket | Where-Object { $_.LogonType -eq 3 -and $_.LogonID -ne 0 }
Clear-Variable __VSCodeOriginalPSConsoleHostReadLine
Wait-Process -Id 441014 $tickets



# 32. The Graphs Window: This is where you can see graphs and charts
#    that help you analyze the packets that meet your filter criteria. To open
#    the Graphs Window, click the "Window" menu and select "Graphs." You can
#    customize the appearance of the graphs by right-clicking on the
#    graph and selecting "Preferences."
# 33. The Hex Editor: This is used to view and edit the packet data in
#    hexadecimal format. To open the Hex Editor, click the "Window" menu and
#    select "Hex View." You can customize the appearance of the Hex Editor
#    by right-clicking on the Hex Editor and selecting "Preferences."
# 34. The Preferences Window: This is where you can customize the
#    appearance and behavior of Wireshark. To open the Preferences Window,
#    click the "File" menu and select "Preferences." You can customize the
#    appearance of Wireshark by selecting the "Appearance" tab and
#    making any desired changes.
# 35. The Help Window: This is where you can see information about
#    Wireshark, including its features and how to use the interface. To open
#    the Help Window, click the "Help" menu and select "Help." You can find
#    information about Wireshark in the "Help" menu as well as online
#    documentation.
# 36. The About Wireshark Window: This is where you can see information
#    about Wireshark, including its version number and copyright
#    information. To open the About Wireshark Window, click the "Help" menu
#    and select "About Wireshark." You can find information about the
#    Wireshark project and its contributors.
# 37. The Statistics Window: This is where you can see statistics about
#    the packets that meet your filter criteria. To open the Statistics
#    Window, click the "Window" menu and select "Statistics." You can
# 38. The Graphs Window: This is where you can see graphs and charts
#    that help you analyze the packets that meet your filter criteria. To open
#    the Graphs Window, click the "Window" menu and select "Graphs." You can
#    customize the appearance of the graphs by right-clicking on the
#    graph and selecting "Preferences."
# 39. The Hex Editor: This is used to view and edit the packet data in
#    hexadecimal format. To open the Hex Editor, click the "Window" menu and
#    select "Hex View." You can customize the appearance of the Hex Editor
#    by right-clicking on the Hex Editor and selecting "Preferences."
# 40. The Preferences Window: This is where you can customize the
#    appearance and behavior of Wireshark. To open the Preferences Window,
#    click the "File" menu and select "Preferences." You can customize the
#    appearance of Wireshark by selecting the "Appearance" tab and
#    making any desired changes.
# 41. The Help Window: This is where you can see information about
#    Wireshark, including its features and how to use the interface. To open
#    the Help Window, click the "Help" menu and select "Help." You can find
#    information about Wireshark in the "Help" menu as well as online
#    documentation.
# 42. The About Wireshark Window: This is where you can see information
#    about Wireshark, including its version number and copyright
#    information. To open the About Wireshark Window, click the "Help" menu
#    and select "About Wireshark." You can find information about the
#    Wireshark project and its contributors.
# 43. The Statistics Window: This is where you can see statistics about
#    the packets that meet your filter criteria. To open the Statistics
#    Window, click the "Window" menu and select "Statistics." You can
# 44. The Graphs Window: This is where you can see graphs and charts
#    that help you analyze the packets that meet your filter criteria. To open
#    the Graphs Window, click the "Window" menu and select "Graphs." You can
#    customize the appearance of the graphs by right-clicking on the
#    graph and selecting "Preferences."
# 45. The Hex Editor: This is used to view and edit the packet data in
#    hexadecimal format. To open the Hex Editor, click the "Window" menu and
#    select "Hex View." You can customize the appearance of the Hex Editor
#    by right-clicking on the Hex Editor and selecting "Preferences."
# 46. The Preferences Window: This is where you can customize the
#    appearance and behavior of Wireshark. To open the Preferences Window,
$callScanIntervalAnalysis = $true
if ($callScanIntervalAnalysis) {
    $scanInterval = 60
    $lastScanTime = (Get-Date).Ticks
    $scanCount = 0
    $lastScanTimeString = Get-Date -Ticks $lastScanTime
    Write-Host "Scan interval: $scanInterval seconds" -BackgroundColor Red -ForegroundColor White
    Write-Host "Last scan: $lastScanTimeString" -BackgroundColor Red -ForegroundColor White
    while ($true) {
        $currentScanTime = (Get-Date).Ticks
        $scanIntervalTicks = $scanInterval * 10000000 # Convert seconds to ticks
        if (($currentScanTime - $lastScanTime) -gt $scanIntervalTicks) {
            $lastScanTime = $currentScanTime
            $scanCount++
            $lastScanTimeString = Get-Date -Ticks $lastScanTime
            Write-Host "Scan interval: $scanInterval seconds" -BackgroundColor Red -ForegroundColor White
            Write-Host "Last scan: $lastScanTimeString" -BackgroundColor Red -ForegroundColor White
            # Perform your scan here
        }
        Start-Sleep -Seconds 1
    }
    Write-Host "Scan interval analysis stopped" -BackgroundColor Red -ForegroundColor White
}
