plugins {
    `cpp-library`
}

library {
    linkage.set(listOf(Linkage.SHARED))
    targetMachines.set(listOf(
            machines.linux.x86_64,
            machines.windows.x86_64,
            machines.macOS.x86_64))
}