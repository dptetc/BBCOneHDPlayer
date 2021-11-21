#include <windows.h>
#include "resource.h"
#include <stdio.h>

int main()
{
    PROCESS_INFORMATION ProcessInfo;

    STARTUPINFO StartupInfo;
    char cmdArgs[] = " https://www.filmon.com/tv/bbc-one best";

    ZeroMemory(&StartupInfo, sizeof(StartupInfo));
    StartupInfo.cb = sizeof StartupInfo;

    if (CreateProcess(".\\bin\\streamlink.exe", cmdArgs,
        NULL, NULL, FALSE, 0, NULL,
        NULL, &StartupInfo, &ProcessInfo))
    {
        WaitForSingleObject(ProcessInfo.hProcess, INFINITE);
        CloseHandle(ProcessInfo.hThread);
        CloseHandle(ProcessInfo.hProcess);
    }
    else
    {
        printf("The process could not be started...");
    }

    return 0;
}