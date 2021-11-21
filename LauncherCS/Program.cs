using System;
using System.Diagnostics;
using System.Reflection;
using System.Runtime.InteropServices;
using System.Text;
using System.Windows.Forms;

namespace BBCOneHDPlayer.LauncherCS
{
	static class Program
	{
		[STAThread]
		static void Main(string[] args)
		{
			Marshal.PrelinkAll(typeof(Program));
			Trace.AutoFlush = true;
			Trace.Listeners.Clear();
			Trace.Listeners.Add(new ConsoleTraceListener());
			Trace.Listeners.Add(new TextWriterTraceListener(System.IO.Path.GetFileNameWithoutExtension(typeof(Program).Assembly.GetName().Name) + ".log"));
			Process currentProcess = Process.GetCurrentProcess();
			currentProcess.PriorityClass = ProcessPriorityClass.High;
			Console.BackgroundColor = ConsoleColor.Black;
			Console.ForegroundColor = ConsoleColor.White;
			try
			{
				const string PlayerPath = @"\bin\streamlink.exe";
				string playerargs = " https://www.filmon.com/tv/bbc-one best";
				ProcessStartInfo Info = new ProcessStartInfo(System.IO.Path.GetDirectoryName(Assembly.GetEntryAssembly().Location) + PlayerPath);
				Info.Arguments = playerargs;
				Info.WorkingDirectory = System.IO.Path.GetDirectoryName(Assembly.GetEntryAssembly().Location);
				Info.UseShellExecute = false;
				Info.RedirectStandardOutput = true;
				Info.RedirectStandardError = true;
				Info.StandardOutputEncoding = Encoding.GetEncoding("CP866");
				Process process = new Process();
				process.StartInfo = Info;
				Action<object, DataReceivedEventArgs> actionWrite = (sender, e) =>
				{
					Trace.WriteLine(e.Data);
				};
				process.ErrorDataReceived += (sender, e) => actionWrite(sender, e);
				process.OutputDataReceived += (sender, e) => actionWrite(sender, e);
				process.Start();
				process.BeginOutputReadLine();
				process.BeginErrorReadLine();
				process.WaitForExit();
			}
			catch (Exception value)
			{
				try
				{
					MessageBox.Show(value.ToString(), "Error");
				}
				catch
				{
				}
			}
		}
	}
}