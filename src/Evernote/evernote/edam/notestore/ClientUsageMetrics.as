/**
 * Autogenerated by Thrift
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 */
package com.evernote.edam.notestore {

import org.apache.thrift.Set;
import org.apache.thrift.type.BigInteger;
import flash.utils.ByteArray;
import flash.utils.Dictionary;

import org.apache.thrift.*;
import org.apache.thrift.meta_data.*;
import org.apache.thrift.protocol.*;


  /**
   * This structure is passed from clients to the Evernote service when they wish
   * to relay coarse-grained usage metrics to the service to help improve
   * products.
   * 
   * <dl>
   *  <dt>sessions</dt>
   *  <dd>
   *    This field contains a count of the number of usage "sessions" that have
   *    occurred with this client which have not previously been reported to
   *    the service.
   *    A "session" is defined as one of the 96 fifteen-minute intervals of the
   *    day when someone used Evernote's interface at least once.
   *    So if a user interacts with an Evernote client at 12:18, 12:24, and 12:36,
   *    and then the client synchronizes at 12:39, it would report that there were
   *    two previously-unreported sessions (one session for the 12:15-12:30 time
   *    period, and one for the 12:30-12:45 period).
   *    If the user used Evernote again at 12:41 and synchronized at 12:43, it
   *    would not report any new sessions, because the 12:30-12:45 session had
   *    already been reported.
   *  </dd>
   * </dl>
   */
  public class ClientUsageMetrics implements TBase   {
    private static const STRUCT_DESC:TStruct = new TStruct("ClientUsageMetrics");
    private static const SESSIONS_FIELD_DESC:TField = new TField("sessions", TType.I32, 1);

    private var _sessions:int;
    public static const SESSIONS:int = 1;

    private var __isset_sessions:Boolean = false;

    public static const metaDataMap:Dictionary = new Dictionary();
    {
      metaDataMap[SESSIONS] = new FieldMetaData("sessions", TFieldRequirementType.OPTIONAL, 
          new FieldValueMetaData(TType.I32));
    }
    {
      FieldMetaData.addStructMetaDataMap(ClientUsageMetrics, metaDataMap);
    }

    public function ClientUsageMetrics() {
    }

    public function get sessions():int {
      return this._sessions;
    }

    public function set sessions(sessions:int):void {
      this._sessions = sessions;
      this.__isset_sessions = true;
    }

    public function unsetSessions():void {
      this.__isset_sessions = false;
    }

    // Returns true if field sessions is set (has been assigned a value) and false otherwise
    public function isSetSessions():Boolean {
      return this.__isset_sessions;
    }

    public function setFieldValue(fieldID:int, value:*):void {
      switch (fieldID) {
      case SESSIONS:
        if (value == null) {
          unsetSessions();
        } else {
          this.sessions = value;
        }
        break;

      default:
        throw new ArgumentError("Field " + fieldID + " doesn't exist!");
      }
    }

    public function getFieldValue(fieldID:int):* {
      switch (fieldID) {
      case SESSIONS:
        return this.sessions;
      default:
        throw new ArgumentError("Field " + fieldID + " doesn't exist!");
      }
    }

    // Returns true if field corresponding to fieldID is set (has been assigned a value) and false otherwise
    public function isSet(fieldID:int):Boolean {
      switch (fieldID) {
      case SESSIONS:
        return isSetSessions();
      default:
        throw new ArgumentError("Field " + fieldID + " doesn't exist!");
      }
    }

    public function read(iprot:TProtocol):void {
      var field:TField;
      iprot.readStructBegin();
      while (true)
      {
        field = iprot.readFieldBegin();
        if (field.type == TType.STOP) { 
          break;
        }
        switch (field.id)
        {
          case SESSIONS:
            if (field.type == TType.I32) {
              this.sessions = iprot.readI32();
              this.__isset_sessions = true;
            } else { 
              TProtocolUtil.skip(iprot, field.type);
            }
            break;
          default:
            TProtocolUtil.skip(iprot, field.type);
            break;
        }
        iprot.readFieldEnd();
      }
      iprot.readStructEnd();


      // check for required fields of primitive type, which can't be checked in the validate method
      validate();
    }

    public function write(oprot:TProtocol):void {
      validate();

      oprot.writeStructBegin(STRUCT_DESC);
      if (isSetSessions()) {
        oprot.writeFieldBegin(SESSIONS_FIELD_DESC);
        oprot.writeI32(this.sessions);
        oprot.writeFieldEnd();
      }
      oprot.writeFieldStop();
      oprot.writeStructEnd();
    }

    public function toString():String {
      var ret:String = new String("ClientUsageMetrics(");
      var first:Boolean = true;

      if (isSetSessions()) {
        ret += "sessions:";
        ret += this.sessions;
        first = false;
      }
      ret += ")";
      return ret;
    }

    public function validate():void {
      // check for required fields
      // check that fields of type enum have valid values
    }

  }

}
