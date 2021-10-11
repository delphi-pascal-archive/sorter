unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, Menus,shellapi;

type
  TForm2 = class(TForm)
    ListBox1: TListBox;
    SpeedButton1: TSpeedButton;
    ListBox2: TListBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Timer1: TTimer;
    ListBox3: TListBox;
    SpeedButton2: TSpeedButton;
    ProgressBar1: TProgressBar;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N3: TMenuItem;
    N2: TMenuItem;
    procedure SpeedButton1Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure ListBox2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm2.SpeedButton1Click(Sender: TObject);
begin
form2.Caption:='Поиск...';
listbox1.Clear;
listbox2.Clear;
listbox3.Clear;
form2.Close;

end;

procedure TForm2.ListBox1Click(Sender: TObject);
begin
listbox2.ItemIndex:=listbox1.ItemIndex;
listbox3.ItemIndex:=listbox1.ItemIndex;
form2.Caption:=listbox3.Items[listbox1.itemindex];
end;

procedure TForm2.ListBox2Click(Sender: TObject);
begin
listbox1.ItemIndex:=listbox2.ItemIndex;
listbox3.ItemIndex:=listbox2.ItemIndex;
form2.Caption:=listbox3.Items[listbox2.itemindex];
end;

procedure TForm2.Timer1Timer(Sender: TObject);
begin
Application.ProcessMessages;
listbox1.ItemIndex:=listbox1.ItemIndex+1;
listbox3.ItemIndex:=listbox1.ItemIndex;
progressbar1.Position:=progressbar1.Position+1;
if form1.radiobutton1.Checked=true then begin
form2.Caption:='Копирование: '+listbox3.Items[listbox3.ItemIndex];
copyfile(PAnsiChar(listbox1.Items[listbox1.ItemIndex]),PAnsiChar(Form1.ShellTreeView2.path+'\'+listbox3.Items[listbox3.ItemIndex]),longbool(0));
end;
if form1.radiobutton4.Checked=true then begin
form2.Caption:='Удаление: '+listbox3.Items[listbox3.ItemIndex];
deletefile(listbox1.Items[listbox1.ItemIndex]);
end;
if form1.radiobutton2.Checked=true then begin
form2.Caption:='Перемещение: '+listbox3.Items[listbox3.ItemIndex];
copyfile(PAnsiChar(listbox1.Items[listbox1.ItemIndex]),PAnsiChar(Form1.ShellTreeView2.path+'\'+listbox3.Items[listbox3.ItemIndex]),longbool(0));
deletefile(listbox1.Items[listbox1.ItemIndex]);

end;

if listbox1.ItemIndex=listbox1.Count-1 then begin
timer1.Enabled:=false;
form1.speedbutton1.Caption:='Начать поиск';
form2.Caption:='Готово';
progressbar1.Position:=0;
form2.SpeedButton2.Enabled:=false;
form2.ListBox1.Enabled:=true;
end;
end;

procedure TForm2.SpeedButton2Click(Sender: TObject);
begin
form2.SpeedButton2.Enabled:=false; 
timer1.Enabled:=false;
 form1.speedbutton1.Caption:='Начать поиск';
form2.Caption:='Готово';
progressbar1.Position:=0;
end;

procedure TForm2.N1Click(Sender: TObject);
begin
ShellExecute(0,'',PAnsiChar( copy(listbox1.Items[listbox1.itemindex],1,length(listbox1.Items[listbox1.ItemIndex])-length(listbox3.Items[listbox3.ItemIndex]))),nil , nil,SW_SHOWNORMAL);
end;

procedure TForm2.N3Click(Sender: TObject);
begin
listbox1.Clear;
listbox2.Clear;
listbox3.Clear;
label4.Caption:='';
label6.Caption:='';
end;

procedure TForm2.N2Click(Sender: TObject);
begin
ShellExecute(0,nil,PAnsiChar(ListBox1.Items[listbox1.itemindex]),nil,nil,SW_SHOWNORMAL);
end;

end.
