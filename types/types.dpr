program types;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

  type
    TSample<T> = record
      private
      type
        FInnerRec<R> = record
          i :R;
        end;
        TQux<T> = class
          X :Integer;
        end;
      public
        vSample :T;
        function Fun<F>(value :F) : F;
    end;

    T1<T> = class(TObject)
      function M1: T;
      public
        volume :Real;
        model, vinNumber, engineSN: T;
    end;

    T2<T> = class(T1<T>)

    end;

    T3<T> = class(T1<Integer>)
    end;

function TSample<T>.Fun<F>(value :F) : F;
begin
  result :=value;
end;


function T1<T>.M1 : T;
begin

end;

var
  Tsl :T1<String>;
begin
  try

    Tsl :=T1<String>.Create;
    Tsl.volume :=1.999;
    Tsl.model :='Mazda 6';
    Tsl.vinNumber :='LFPM4ACC9D1A44423';
    Tsl.engineSN :='80559295';
    Writeln(Format('Vehicle %s :%s', ['Model', Tsl.model]));
    Writeln(Format('Vehicle %s :%s', ['Vin', Tsl.vinNumber]));
    Writeln(Format('Vehicle %s :%s', ['Engine Number', Tsl.engineSN]));
    Writeln(Format('%s :%4.2f %s',['Engine Volume', Tsl.volume, ' Liter']));
    Writeln('press any key to continue ......');
    readln;


    { TODO -oUser -cConsole Main : Insert code here }
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.