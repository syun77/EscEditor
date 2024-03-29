package esc;

import flixel.group.FlxSpriteGroup;
import ui.NumberInputSubState;
import ui.PictureInputSubState;
import lib.AdvScript;

/**
 * 状態
 */
private enum State {
    Standby; // 待機中
    Execute; // 実行中
    KeyWait; // キー入力待ち
    MsgWait; // メッセージ表示待ち
}

/**
 * スクリプト管理
 */
class EscScript extends FlxSpriteGroup {
    var _state:State = State.Standby;
    var _script:AdvScript;
    var _wait:Float = 0;
    var _isLog:Bool = false;
    var _isCompleted:Bool = false; // ゲームクリアフラグ

    /**
     * コンストラクタ
     */
    public function new() {
        super();
        _init();
    }

    /**
     * 初期化
     */
    function _init():Void {
        _wait = 0;
    }

    /**
     * 実行を終了したかどうか
     */
    public function isEnd():Bool {
        return _state == State.Standby;
    }

    /**
     * ゲームをクリアしたかどうか
     */
    public function isCompleted():Bool {
        return _isCompleted;
    }

    /**
     * 更新
     */
    override public function update(elapsed:Float):Void {
        super.update(elapsed);

        switch(_state) {
            case State.Standby:
                // 何もしない
            case State.Execute:
                _updateExecute(elapsed);
            case State.MsgWait:
            case State.KeyWait:
        }
    }

    function _updateExecute(elapsed:Float):Void {
        if(_wait > 0) {
            // 実行停止中
            _wait -= elapsed;
            return;
        }

        _script.update();
        if(_script.isEnd()) {
            // 実行終了
            _state = State.Standby;
        }
    }

    /**
     * 実行
     */
    public function execute(filepath:String):Void {
        _init();

        // 実行
        var tbl = [
            "WAIT"      => _WAIT,
            "MSG"       => _MSG,
            "NUM_INPUT" => _NUM_INPUT,
            "PIC_INPUT" => _PIC_INPUT,
            "JUMP"      => _JUMP,
            "ITEM_ADD"  => _ITEM_ADD,
            "ITEM_HAS"  => _ITEM_HAS,
            "ITEM_DEL"  => _ITEM_DEL,
            "ITEM_CHK"  => _ITEM_CHK,
            "COMPLETE"  => _COMPLETE,
        ];
        _script = new AdvScript(tbl, filepath);
        _register();
        _script.setLog(true);
        _isLog = true;
        _state = State.Execute;
    }
    function _WAIT(param:Array<String>):Int {
        _log('WAIT');
        var sec = _script.popStack();
        _wait = sec;
        return AdvScript.RET_YIELD;
    }
    function _MSG(param:Array<String>):Int {
        _log('MSG');
        var type = Std.parseInt(param[0]);
        var msg = param[1];
        var r = ~/\$V(\d+)/;
        if(r.match(msg)) {
            // $V[n] を変数に置き換え
            var idx = Std.parseInt(r.matched(1));
            var val = EscGlobal.valGet(idx);
            msg = r.replace(msg, '${val}');
        }
        
        // インフォメーション表示
        PlayState.getInformationUI().start(msg, 3);
        return AdvScript.RET_CONTINUE;
    }
    function _NUM_INPUT(param:Array<String>):Int {
        _log('NUM_INPUT');
        var idx = _script.popStack();
        var digit = _script.popStack();
        EscGlobal.numberInputSet(idx, digit);
        var editor = PlayState.getEditor();
        if(editor != null) {
            editor.openSubState(new NumberInputSubState());
        }
        return AdvScript.RET_YIELD;
    }
    function _PIC_INPUT(param:Array<String>):Int {
        _log('PIC_INPUT');
        var pic = _script.popStack();
        var idx = _script.popStack();
        var digit = _script.popStack();
        EscGlobal.numberInputSet(idx, digit);
        var editor = PlayState.getEditor();
        if(editor != null) {
            editor.openSubState(new PictureInputSubState(pic, digit));
        }
        return AdvScript.RET_YIELD;
    }
    function _JUMP(param:Array<String>):Int {
        var sceneID = _script.popStack();
        _log('SCENE JUMP -> ${sceneID}');
        EscGlobal.setNextSceneID(sceneID);
        return AdvScript.RET_EXIT;
    }
    function _ITEM_ADD(param:Array<String>):Int {
        _log('ITEM_ADD');
        var itemID = _script.popStack();
        EscGlobal.itemAdd(itemID);

        // アイテム入手メッセージ表示
        var msg = '「${EscGlobal.itemName(itemID)}」を手に入れた';
        PlayState.getInformationUI().start(msg, 3);
        return AdvScript.RET_YIELD;
    }
    function _ITEM_HAS(param:Array<String>):Int {
        _log('ITEM_HAS');
        var itemID = _script.popStack();
        if(EscGlobal.itemHas(itemID)) {
            EscGlobal.retSet(1);
        }
        else {
            EscGlobal.retSet(0);
        }
        return AdvScript.RET_CONTINUE;
    }
    function _ITEM_DEL(param:Array<String>):Int {
        _log('ITEM_DEL');
        var itemID = _script.popStack();
        if(EscGlobal.itemDel(itemID)) {
            EscGlobal.retSet(1);
        }
        else {
            EscGlobal.retSet(0);
        }
        return AdvScript.RET_CONTINUE;
    }
    function _ITEM_CHK(param:Array<String>):Int {
        _log('ITEM_CHK');
        var itemID = _script.popStack();
        if(EscGlobal.itemCheck(itemID)) {
            EscGlobal.retSet(1);
        }
        else {
            EscGlobal.retSet(0);
        }
        return AdvScript.RET_CONTINUE;
    }
    function _COMPLETE(param:Array<String>):Int {
        _log('COMPLETE');
        _isCompleted = true;
        return AdvScript.RET_EXIT;
    }

    /**
    * ログの出力
    **/
    function _log(msg:String):Void {
        if(_isLog) {
            trace('[SCRIPT] ${msg}');
        }
    }

    /**
     * 登録
     */
    function _register():Void {
        // フラグ
        _script.funcLengthBit = function() { return EscGlobal.MAX_FLAG; }
        _script.funcSetBit = EscGlobal.flagSet;
        _script.funcGetBit = EscGlobal.flagCheck;

        // 変数
        _script.funcLengthVar = function() { return EscGlobal.MAX_VAL; }
        _script.funcSetVar = EscGlobal.valSet;
        _script.funcGetVar = EscGlobal.valGet;
    }

}