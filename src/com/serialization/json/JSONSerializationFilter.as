package com.serialization.json {
    import com.adobe.serializers.*;
    import com.adobe.serializers.utility.*;
    import flash.utils.*;
    import mx.rpc.http.*;
    import com.serialization.json.JSON;

    public class JSONSerializationFilter extends com.adobe.serializers.BaseSerializationFilter {
        public function JSONSerializationFilter() {
            super();
            return;
        }
        public override function deserializeResult(op:AbstractOperation, obj:Object):Object {
            return JSON.deserialize(obj as String);
        }
    }
}
