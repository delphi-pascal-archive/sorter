unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ShellCtrls, XPMan, Buttons, FileCtrl,
  ExtCtrls;

type
  TForm1 = class(TForm)
    ShellTreeView1: TShellTreeView;
    Label1: TLabel;
    ShellTreeView2: TShellTreeView;
    Label2: TLabel;
    XPManifest1: TXPManifest;
    GroupBox1: TGroupBox;
    ComboBox1: TComboBox;
    Label3: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    DriveComboBox1: TDriveComboBox;
    DriveComboBox2: TDriveComboBox;
    CheckBox1: TCheckBox;
    Bevel1: TBevel;
    SpeedButton1: TSpeedButton;
    Label4: TLabel;
    Edit1: TEdit;
    RadioButton3: TRadioButton;
    Edit2: TEdit;
    Animate1: TAnimate;
    RadioButton4: TRadioButton;
    CheckBox2: TCheckBox;
    procedure DriveComboBox1Change(Sender: TObject);
    procedure DriveComboBox2Change(Sender: TObject);
    procedure FindFile(Dir:String);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ShellTreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure ShellTreeView2Change(Sender: TObject; Node: TTreeNode);
    procedure RadioButton4Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  SR:TSearchRec;
implementation

uses Unit2;

{$R *.dfm}

procedure TForm1.DriveComboBox1Change(Sender: TObject);
begin
shelltreeview1.Root:=DriveComboBox1.Drive+':\';
end;

procedure TForm1.DriveComboBox2Change(Sender: TObject);
begin
shelltreeview2.Root:=DriveComboBox2.Drive+':\';
end;


procedure TForm1.FindFile(Dir:String);
var
 i:integer;
 SR:TSearchRec;
 FindRes:Integer;
 Dir1,Dir2:string;
begin


 i:=0;
 FindRes:=FindFirst(Dir+'*.*',faAnyFile,SR);
 while FindRes=0 do
  begin
   if ((SR.Attr and faDirectory)=faDirectory) and
   ((SR.Name='.')or(SR.Name='..')) then
     begin
      FindRes:=FindNext(SR);
      Continue;
     end;
   // если найден каталог, то
   if checkbox2.Checked=true then begin
   if ((SR.Attr and faDirectory)=faDirectory) then
    begin
     // входим в процедуру поиска с параметрами текущего каталога +
     // каталог, что мы нашли
     FindFile(Dir+SR.Name+'\');
     label4.Caption:='Поиск: '+dir+sr.Name;
     FindRes:=FindNext(SR);
     // после осмотра вложенного каталога мы продолжаем поиск
     // в этом каталоге
     Continue; // продолжить цикл
    end;
    end;

    if checkbox2.Checked=false then begin
   if ((SR.Attr and faDirectory)=faDirectory) then
    begin
     FindRes:=FindNext(SR);
     Continue;
    end;
    end;

   if checkbox1.Checked=true then begin
    if (combobox1.Text<>'*.*') and (copy(sr.Name,length(sr.name)-length(combobox1.Text)+1,length(combobox1.Text))=combobox1.Text) then begin
   form2.ListBox1.Items.Add(dir+SR.Name);
   form2.ListBox1.ItemIndex:=form2.ListBox1.Count-1;
   
   form2.ListBox3.Items.Add(SR.Name);
  form2.ListBox3.ItemIndex:=form2.ListBox1.ItemIndex;
      form2.Caption:=form2.ListBox3.Items[form2.ListBox3.itemindex];
   form2.ListBox2.Items.Add(inttostr(sr.size));
   form2.Label4.Caption:=inttostr(form2.ListBox1.Count);
   form2.Label6.Caption:=floattostr(strtofloat(form2.Label6.Caption)+strtofloat(form2.ListBox2.Items[form2.ListBox2.Count-1]));
   end;

   end;
   if Application.Terminated then Break;
   Application.ProcessMessages;
   FindRes:=FindNext(SR);
  end;


 FindClose(SR);

end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
var
i, MaxWidth: integer;
begin
animate1.Active:=true;
speedbutton1.Caption:='Работаю...';
if checkbox1.Checked=true then begin
form2.Caption:='Идет поиск...';
form2.Show;
end;

form2.ListBox1.Clear;                   // очистка списка файлов
form2.ListBox2.Clear;                   // очистка списка размеров файлов
form2.ListBox3.Clear;                   // очистка списка имен файлов
form2.Label6.Caption:='0';              // обнуление общего размера

FindFile(Edit1.Text);                   //Поиск
// Конечный операции после поиска
animate1.Active:=false;
label4.Caption:='Поиск:';
form2.Label4.Caption:=inttostr(form2.ListBox1.Count); //Количестово найденых файлов
form2.ListBox1.ItemIndex:=0;
form2.progressbar1.Max:=form2.ListBox1.Count;
                                        // Добавление горизонтальной прокрутки в form2.listbox1
MaxWidth := 0;
for i := 0 to form2.ListBox1.Items.Count - 1 do
if MaxWidth < form2.ListBox1.Canvas.TextWidth(form2.ListBox1.Items.Strings[i]) then
MaxWidth := form2.ListBox1.Canvas.TextWidth(form2.ListBox1.Items.Strings[i]);
SendMessage(form2.ListBox1.Handle, LB_SETHORIZONTALEXTENT, MaxWidth+2, 0);

if form2.ListBox1.Items.Text<>'' then begin
if radiobutton1.Checked=true then begin
copyfile(PAnsiChar(form2.listbox1.Items[0]),PAnsiChar(Form1.ShellTreeView2.path+'\'+form2.listbox3.Items[0]),longbool(0));
end;
if radiobutton2.Checked=true then begin
copyfile(PAnsiChar(form2.listbox1.Items[0]),PAnsiChar(Form1.ShellTreeView2.path+'\'+form2.listbox3.Items[0]),longbool(0));
deletefile(form2.listbox1.Items[0]);
end;
if radiobutton4.Checked=true then begin
deletefile(form2.listbox1.Items[0]);
end;
end;
if radiobutton3.Checked=false then begin
form2.Timer1.Enabled:=true;            //Включение таймера
form2.SpeedButton2.Enabled:=true;
form2.ListBox1.Enabled:=false;

end;
if radiobutton3.Checked=true then begin
form2.Caption:='Готово';
form1.speedbutton1.Caption:='Начать поиск';

end;
end;


procedure TForm1.ShellTreeView1Change(Sender: TObject; Node: TTreeNode);
begin
edit1.Text:=shelltreeview1.Path+'\';
end;

procedure TForm1.ShellTreeView2Change(Sender: TObject; Node: TTreeNode);
begin
 edit2.Text:=shelltreeview2.Path+'\';
end;

procedure TForm1.RadioButton4Click(Sender: TObject);
begin
shelltreeview2.Enabled:=false;
end;

procedure TForm1.RadioButton3Click(Sender: TObject);
begin
shelltreeview2.Enabled:=false;
end;

procedure TForm1.RadioButton2Click(Sender: TObject);
begin
shelltreeview2.Enabled:=true;
end;

procedure TForm1.RadioButton1Click(Sender: TObject);
begin
shelltreeview2.Enabled:=true;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
shelltreeview2.Enabled:=false;
end;

end.
