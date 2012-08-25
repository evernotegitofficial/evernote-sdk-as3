/**
 * Autogenerated by Thrift
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 */
package com.evernote.edam.type {

import org.apache.thrift.Set;
import org.apache.thrift.type.BigInteger;
import flash.utils.ByteArray;
import flash.utils.Dictionary;

import org.apache.thrift.*;
import org.apache.thrift.meta_data.*;
import org.apache.thrift.protocol.*;

import com.evernote.edam.type.Resource;
import com.evernote.edam.type.NoteAttributes;

  /**
   * Represents a single note in the user's account.
   * 
   * <dl>
   * <dt>guid</dt>
   *   <dd>The unique identifier of this note.  Will be set by the
   *   server, but will be omitted by clients calling NoteStore.createNote()
   *   <br/>
   *   Length:  EDAM_GUID_LEN_MIN - EDAM_GUID_LEN_MAX
   *   <br/>
   *   Regex:  EDAM_GUID_REGEX
   *   </dd>
   * 
   * <dt>title</dt>
   *   <dd>The subject of the note.  Can't begin or end with a space.
   *   <br/>
   *   Length:  EDAM_NOTE_TITLE_LEN_MIN - EDAM_NOTE_TITLE_LEN_MAX
   *   <br/>
   *   Regex:  EDAM_NOTE_TITLE_REGEX
   *   </dd>
   * 
   * <dt>content</dt>
   *   <dd>The XHTML block that makes up the note.  This is
   *   the canonical form of the note's contents, so will include abstract
   *   Evernote tags for internal resource references.  A client may create
   *   a separate transformed version of this content for internal presentation,
   *   but the same canonical bytes should be used for transmission and
   *   comparison unless the user chooses to modify their content.
   *   <br/>
   *   Length:  EDAM_NOTE_CONTENT_LEN_MIN - EDAM_NOTE_CONTENT_LEN_MAX
   *   </dd>
   * 
   * <dt>contentHash</dt>
   *   <dd>The binary MD5 checksum of the UTF-8 encoded content
   *   body. This will always be set by the server, but clients may choose to omit
   *   this when they submit a note with content.
   *   <br/>
   *   Length:  EDAM_HASH_LEN (exactly)
   *   </dd>
   * 
   * <dt>contentLength</dt>
   *   <dd>The number of Unicode characters in the content of
   *   the note.  This will always be set by the service, but clients may choose
   *   to omit this value when they submit a Note.
   *   </dd>
   * 
   * <dt>created</dt>
   *   <dd>The date and time when the note was created in one of the
   *   clients.  In most cases, this will match the user's sense of when
   *   the note was created, and ordering between notes will be based on
   *   ordering of this field.  However, this is not a "reliable" timestamp
   *   if a client has an incorrect clock, so it cannot provide a true absolute
   *   ordering between notes.  Notes created directly through the service
   *   (e.g. via the web GUI) will have an absolutely ordered "created" value.
   *   </dd>
   * 
   * <dt>updated</dt>
   *   <dd>The date and time when the note was last modified in one of
   *   the clients.  In most cases, this will match the user's sense of when
   *   the note was modified, but this field may not be absolutely reliable
   *   due to the possibility of client clock errors.
   *   </dd>
   * 
   * <dt>deleted</dt>
   *   <dd>If present, the note is considered "deleted", and this
   *   stores the date and time when the note was deleted by one of the clients.
   *   In most cases, this will match the user's sense of when the note was
   *   deleted, but this field may be unreliable due to the possibility of
   *   client clock errors.
   *   </dd>
   * 
   * <dt>active</dt>
   *   <dd>If the note is available for normal actions and viewing,
   *   this flag will be set to true.
   *   </dd>
   * 
   * <dt>updateSequenceNum</dt>
   *   <dd>A number identifying the last transaction to
   *   modify the state of this note (including changes to the note's attributes
   *   or resources).  The USN values are sequential within an account,
   *   and can be used to compare the order of modifications within the service.
   *   </dd>
   * 
   * <dt>notebookGuid</dt>
   *   <dd>The unique identifier of the notebook that contains
   *   this note.  If no notebookGuid is provided on a call to createNote(), the
   *   default notebook will be used instead.
   *   <br/>
   *   Length:  EDAM_GUID_LEN_MIN - EDAM_GUID_LEN_MAX
   *   <br/>
   *   Regex:  EDAM_GUID_REGEX
   *   </dd>
   * 
   * <dt>tagGuids</dt>
   *   <dd>A list of the GUID identifiers for tags that are applied to this note.
   *   This may be provided in a call to createNote() to unambiguously declare
   *   the tags that should be assigned to the new note.  Alternately, clients
   *   may pass the names of desired tags via the 'tagNames' field during
   *   note creation.
   *   If the list of tags are omitted on a call to createNote(), then
   *   the server will assume that no changes have been made to the resources.
   *   Maximum:  EDAM_NOTE_TAGS_MAX tags per note
   *   </dd>
   * 
   * <dt>resources</dt>
   *   <dd>The list of resources that are embedded within this note.
   *   If the list of resources are omitted on a call to updateNote(), then
   *   the server will assume that no changes have been made to the resources.
   *   The binary contents of the resources must be provided when the resource
   *   is first sent to the service, but it will be omitted by the service when
   *   the Note is returned in the future.
   *   Maximum:  EDAM_NOTE_RESOURCES_MAX resources per note
   *   </dd>
   * 
   * <dt>attributes</dt>
   *   <dd>A list of the attributes for this note.
   *   If the list of attributes are omitted on a call to updateNote(), then
   *   the server will assume that no changes have been made to the resources.
   *   </dd>
   * 
   * <dt>tagNames</dt>
   *   <dd>May be provided by clients during calls to createNote() as an
   *   alternative to providing the tagGuids of existing tags.  If any tagNames
   *   are provided during createNote(), these will be found, or created if they
   *   don't already exist.  Created tags will have no parent (they will be at
   *   the top level of the tag panel).
   *   </dd>
   * </dl>
   */
  public class Note implements TBase   {
    private static const STRUCT_DESC:TStruct = new TStruct("Note");
    private static const GUID_FIELD_DESC:TField = new TField("guid", TType.STRING, 1);
    private static const TITLE_FIELD_DESC:TField = new TField("title", TType.STRING, 2);
    private static const CONTENT_FIELD_DESC:TField = new TField("content", TType.STRING, 3);
    private static const CONTENT_HASH_FIELD_DESC:TField = new TField("contentHash", TType.STRING, 4);
    private static const CONTENT_LENGTH_FIELD_DESC:TField = new TField("contentLength", TType.I32, 5);
    private static const CREATED_FIELD_DESC:TField = new TField("created", TType.I64, 6);
    private static const UPDATED_FIELD_DESC:TField = new TField("updated", TType.I64, 7);
    private static const DELETED_FIELD_DESC:TField = new TField("deleted", TType.I64, 8);
    private static const ACTIVE_FIELD_DESC:TField = new TField("active", TType.BOOL, 9);
    private static const UPDATE_SEQUENCE_NUM_FIELD_DESC:TField = new TField("updateSequenceNum", TType.I32, 10);
    private static const NOTEBOOK_GUID_FIELD_DESC:TField = new TField("notebookGuid", TType.STRING, 11);
    private static const TAG_GUIDS_FIELD_DESC:TField = new TField("tagGuids", TType.LIST, 12);
    private static const RESOURCES_FIELD_DESC:TField = new TField("resources", TType.LIST, 13);
    private static const ATTRIBUTES_FIELD_DESC:TField = new TField("attributes", TType.STRUCT, 14);
    private static const TAG_NAMES_FIELD_DESC:TField = new TField("tagNames", TType.LIST, 15);

    private var _guid:String;
    public static const GUID:int = 1;
    private var _title:String;
    public static const TITLE:int = 2;
    private var _content:String;
    public static const CONTENT:int = 3;
    private var _contentHash:ByteArray;
    public static const CONTENTHASH:int = 4;
    private var _contentLength:int;
    public static const CONTENTLENGTH:int = 5;
    private var _created:BigInteger;
    public static const CREATED:int = 6;
    private var _updated:BigInteger;
    public static const UPDATED:int = 7;
    private var _deleted:BigInteger;
    public static const DELETED:int = 8;
    private var _active:Boolean;
    public static const ACTIVE:int = 9;
    private var _updateSequenceNum:int;
    public static const UPDATESEQUENCENUM:int = 10;
    private var _notebookGuid:String;
    public static const NOTEBOOKGUID:int = 11;
    private var _tagGuids:Array;
    public static const TAGGUIDS:int = 12;
    private var _resources:Array;
    public static const RESOURCES:int = 13;
    private var _attributes:NoteAttributes;
    public static const ATTRIBUTES:int = 14;
    private var _tagNames:Array;
    public static const TAGNAMES:int = 15;

    private var __isset_contentLength:Boolean = false;
    private var __isset_created:Boolean = false;
    private var __isset_updated:Boolean = false;
    private var __isset_deleted:Boolean = false;
    private var __isset_active:Boolean = false;
    private var __isset_updateSequenceNum:Boolean = false;

    public static const metaDataMap:Dictionary = new Dictionary();
    {
      metaDataMap[GUID] = new FieldMetaData("guid", TFieldRequirementType.OPTIONAL, 
          new FieldValueMetaData(TType.STRING));
      metaDataMap[TITLE] = new FieldMetaData("title", TFieldRequirementType.OPTIONAL, 
          new FieldValueMetaData(TType.STRING));
      metaDataMap[CONTENT] = new FieldMetaData("content", TFieldRequirementType.OPTIONAL, 
          new FieldValueMetaData(TType.STRING));
      metaDataMap[CONTENTHASH] = new FieldMetaData("contentHash", TFieldRequirementType.OPTIONAL, 
          new FieldValueMetaData(TType.STRING));
      metaDataMap[CONTENTLENGTH] = new FieldMetaData("contentLength", TFieldRequirementType.OPTIONAL, 
          new FieldValueMetaData(TType.I32));
      metaDataMap[CREATED] = new FieldMetaData("created", TFieldRequirementType.OPTIONAL, 
          new FieldValueMetaData(TType.I64));
      metaDataMap[UPDATED] = new FieldMetaData("updated", TFieldRequirementType.OPTIONAL, 
          new FieldValueMetaData(TType.I64));
      metaDataMap[DELETED] = new FieldMetaData("deleted", TFieldRequirementType.OPTIONAL, 
          new FieldValueMetaData(TType.I64));
      metaDataMap[ACTIVE] = new FieldMetaData("active", TFieldRequirementType.OPTIONAL, 
          new FieldValueMetaData(TType.BOOL));
      metaDataMap[UPDATESEQUENCENUM] = new FieldMetaData("updateSequenceNum", TFieldRequirementType.OPTIONAL, 
          new FieldValueMetaData(TType.I32));
      metaDataMap[NOTEBOOKGUID] = new FieldMetaData("notebookGuid", TFieldRequirementType.OPTIONAL, 
          new FieldValueMetaData(TType.STRING));
      metaDataMap[TAGGUIDS] = new FieldMetaData("tagGuids", TFieldRequirementType.OPTIONAL, 
          new ListMetaData(TType.LIST, 
              new FieldValueMetaData(TType.STRING)));
      metaDataMap[RESOURCES] = new FieldMetaData("resources", TFieldRequirementType.OPTIONAL, 
          new ListMetaData(TType.LIST, 
              new StructMetaData(TType.STRUCT, Resource)));
      metaDataMap[ATTRIBUTES] = new FieldMetaData("attributes", TFieldRequirementType.OPTIONAL, 
          new StructMetaData(TType.STRUCT, NoteAttributes));
      metaDataMap[TAGNAMES] = new FieldMetaData("tagNames", TFieldRequirementType.OPTIONAL, 
          new ListMetaData(TType.LIST, 
              new FieldValueMetaData(TType.STRING)));
    }
    {
      FieldMetaData.addStructMetaDataMap(Note, metaDataMap);
    }

    public function Note() {
    }

    public function get guid():String {
      return this._guid;
    }

    public function set guid(guid:String):void {
      this._guid = guid;
    }

    public function unsetGuid():void {
      this.guid = null;
    }

    // Returns true if field guid is set (has been assigned a value) and false otherwise
    public function isSetGuid():Boolean {
      return this.guid != null;
    }

    public function get title():String {
      return this._title;
    }

    public function set title(title:String):void {
      this._title = title;
    }

    public function unsetTitle():void {
      this.title = null;
    }

    // Returns true if field title is set (has been assigned a value) and false otherwise
    public function isSetTitle():Boolean {
      return this.title != null;
    }

    public function get content():String {
      return this._content;
    }

    public function set content(content:String):void {
      this._content = content;
    }

    public function unsetContent():void {
      this.content = null;
    }

    // Returns true if field content is set (has been assigned a value) and false otherwise
    public function isSetContent():Boolean {
      return this.content != null;
    }

    public function get contentHash():ByteArray {
      return this._contentHash;
    }

    public function set contentHash(contentHash:ByteArray):void {
      this._contentHash = contentHash;
    }

    public function unsetContentHash():void {
      this.contentHash = null;
    }

    // Returns true if field contentHash is set (has been assigned a value) and false otherwise
    public function isSetContentHash():Boolean {
      return this.contentHash != null;
    }

    public function get contentLength():int {
      return this._contentLength;
    }

    public function set contentLength(contentLength:int):void {
      this._contentLength = contentLength;
      this.__isset_contentLength = true;
    }

    public function unsetContentLength():void {
      this.__isset_contentLength = false;
    }

    // Returns true if field contentLength is set (has been assigned a value) and false otherwise
    public function isSetContentLength():Boolean {
      return this.__isset_contentLength;
    }

    public function get created():BigInteger {
      return this._created;
    }

    public function set created(created:BigInteger):void {
      this._created = created;
      this.__isset_created = true;
    }

    public function unsetCreated():void {
      this.__isset_created = false;
    }

    // Returns true if field created is set (has been assigned a value) and false otherwise
    public function isSetCreated():Boolean {
      return this.__isset_created;
    }

    public function get updated():BigInteger {
      return this._updated;
    }

    public function set updated(updated:BigInteger):void {
      this._updated = updated;
      this.__isset_updated = true;
    }

    public function unsetUpdated():void {
      this.__isset_updated = false;
    }

    // Returns true if field updated is set (has been assigned a value) and false otherwise
    public function isSetUpdated():Boolean {
      return this.__isset_updated;
    }

    public function get deleted():BigInteger {
      return this._deleted;
    }

    public function set deleted(deleted:BigInteger):void {
      this._deleted = deleted;
      this.__isset_deleted = true;
    }

    public function unsetDeleted():void {
      this.__isset_deleted = false;
    }

    // Returns true if field deleted is set (has been assigned a value) and false otherwise
    public function isSetDeleted():Boolean {
      return this.__isset_deleted;
    }

    public function get active():Boolean {
      return this._active;
    }

    public function set active(active:Boolean):void {
      this._active = active;
      this.__isset_active = true;
    }

    public function unsetActive():void {
      this.__isset_active = false;
    }

    // Returns true if field active is set (has been assigned a value) and false otherwise
    public function isSetActive():Boolean {
      return this.__isset_active;
    }

    public function get updateSequenceNum():int {
      return this._updateSequenceNum;
    }

    public function set updateSequenceNum(updateSequenceNum:int):void {
      this._updateSequenceNum = updateSequenceNum;
      this.__isset_updateSequenceNum = true;
    }

    public function unsetUpdateSequenceNum():void {
      this.__isset_updateSequenceNum = false;
    }

    // Returns true if field updateSequenceNum is set (has been assigned a value) and false otherwise
    public function isSetUpdateSequenceNum():Boolean {
      return this.__isset_updateSequenceNum;
    }

    public function get notebookGuid():String {
      return this._notebookGuid;
    }

    public function set notebookGuid(notebookGuid:String):void {
      this._notebookGuid = notebookGuid;
    }

    public function unsetNotebookGuid():void {
      this.notebookGuid = null;
    }

    // Returns true if field notebookGuid is set (has been assigned a value) and false otherwise
    public function isSetNotebookGuid():Boolean {
      return this.notebookGuid != null;
    }

    public function get tagGuids():Array {
      return this._tagGuids;
    }

    public function set tagGuids(tagGuids:Array):void {
      this._tagGuids = tagGuids;
    }

    public function unsetTagGuids():void {
      this.tagGuids = null;
    }

    // Returns true if field tagGuids is set (has been assigned a value) and false otherwise
    public function isSetTagGuids():Boolean {
      return this.tagGuids != null;
    }

    public function get resources():Array {
      return this._resources;
    }

    public function set resources(resources:Array):void {
      this._resources = resources;
    }

    public function unsetResources():void {
      this.resources = null;
    }

    // Returns true if field resources is set (has been assigned a value) and false otherwise
    public function isSetResources():Boolean {
      return this.resources != null;
    }

    public function get attributes():NoteAttributes {
      return this._attributes;
    }

    public function set attributes(attributes:NoteAttributes):void {
      this._attributes = attributes;
    }

    public function unsetAttributes():void {
      this.attributes = null;
    }

    // Returns true if field attributes is set (has been assigned a value) and false otherwise
    public function isSetAttributes():Boolean {
      return this.attributes != null;
    }

    public function get tagNames():Array {
      return this._tagNames;
    }

    public function set tagNames(tagNames:Array):void {
      this._tagNames = tagNames;
    }

    public function unsetTagNames():void {
      this.tagNames = null;
    }

    // Returns true if field tagNames is set (has been assigned a value) and false otherwise
    public function isSetTagNames():Boolean {
      return this.tagNames != null;
    }

    public function setFieldValue(fieldID:int, value:*):void {
      switch (fieldID) {
      case GUID:
        if (value == null) {
          unsetGuid();
        } else {
          this.guid = value;
        }
        break;

      case TITLE:
        if (value == null) {
          unsetTitle();
        } else {
          this.title = value;
        }
        break;

      case CONTENT:
        if (value == null) {
          unsetContent();
        } else {
          this.content = value;
        }
        break;

      case CONTENTHASH:
        if (value == null) {
          unsetContentHash();
        } else {
          this.contentHash = value;
        }
        break;

      case CONTENTLENGTH:
        if (value == null) {
          unsetContentLength();
        } else {
          this.contentLength = value;
        }
        break;

      case CREATED:
        if (value == null) {
          unsetCreated();
        } else {
          this.created = value;
        }
        break;

      case UPDATED:
        if (value == null) {
          unsetUpdated();
        } else {
          this.updated = value;
        }
        break;

      case DELETED:
        if (value == null) {
          unsetDeleted();
        } else {
          this.deleted = value;
        }
        break;

      case ACTIVE:
        if (value == null) {
          unsetActive();
        } else {
          this.active = value;
        }
        break;

      case UPDATESEQUENCENUM:
        if (value == null) {
          unsetUpdateSequenceNum();
        } else {
          this.updateSequenceNum = value;
        }
        break;

      case NOTEBOOKGUID:
        if (value == null) {
          unsetNotebookGuid();
        } else {
          this.notebookGuid = value;
        }
        break;

      case TAGGUIDS:
        if (value == null) {
          unsetTagGuids();
        } else {
          this.tagGuids = value;
        }
        break;

      case RESOURCES:
        if (value == null) {
          unsetResources();
        } else {
          this.resources = value;
        }
        break;

      case ATTRIBUTES:
        if (value == null) {
          unsetAttributes();
        } else {
          this.attributes = value;
        }
        break;

      case TAGNAMES:
        if (value == null) {
          unsetTagNames();
        } else {
          this.tagNames = value;
        }
        break;

      default:
        throw new ArgumentError("Field " + fieldID + " doesn't exist!");
      }
    }

    public function getFieldValue(fieldID:int):* {
      switch (fieldID) {
      case GUID:
        return this.guid;
      case TITLE:
        return this.title;
      case CONTENT:
        return this.content;
      case CONTENTHASH:
        return this.contentHash;
      case CONTENTLENGTH:
        return this.contentLength;
      case CREATED:
        return this.created;
      case UPDATED:
        return this.updated;
      case DELETED:
        return this.deleted;
      case ACTIVE:
        return this.active;
      case UPDATESEQUENCENUM:
        return this.updateSequenceNum;
      case NOTEBOOKGUID:
        return this.notebookGuid;
      case TAGGUIDS:
        return this.tagGuids;
      case RESOURCES:
        return this.resources;
      case ATTRIBUTES:
        return this.attributes;
      case TAGNAMES:
        return this.tagNames;
      default:
        throw new ArgumentError("Field " + fieldID + " doesn't exist!");
      }
    }

    // Returns true if field corresponding to fieldID is set (has been assigned a value) and false otherwise
    public function isSet(fieldID:int):Boolean {
      switch (fieldID) {
      case GUID:
        return isSetGuid();
      case TITLE:
        return isSetTitle();
      case CONTENT:
        return isSetContent();
      case CONTENTHASH:
        return isSetContentHash();
      case CONTENTLENGTH:
        return isSetContentLength();
      case CREATED:
        return isSetCreated();
      case UPDATED:
        return isSetUpdated();
      case DELETED:
        return isSetDeleted();
      case ACTIVE:
        return isSetActive();
      case UPDATESEQUENCENUM:
        return isSetUpdateSequenceNum();
      case NOTEBOOKGUID:
        return isSetNotebookGuid();
      case TAGGUIDS:
        return isSetTagGuids();
      case RESOURCES:
        return isSetResources();
      case ATTRIBUTES:
        return isSetAttributes();
      case TAGNAMES:
        return isSetTagNames();
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
          case GUID:
            if (field.type == TType.STRING) {
              this.guid = iprot.readString();
            } else { 
              TProtocolUtil.skip(iprot, field.type);
            }
            break;
          case TITLE:
            if (field.type == TType.STRING) {
              this.title = iprot.readString();
            } else { 
              TProtocolUtil.skip(iprot, field.type);
            }
            break;
          case CONTENT:
            if (field.type == TType.STRING) {
              this.content = iprot.readString();
            } else { 
              TProtocolUtil.skip(iprot, field.type);
            }
            break;
          case CONTENTHASH:
            if (field.type == TType.STRING) {
              this.contentHash = iprot.readBinary();
            } else { 
              TProtocolUtil.skip(iprot, field.type);
            }
            break;
          case CONTENTLENGTH:
            if (field.type == TType.I32) {
              this.contentLength = iprot.readI32();
              this.__isset_contentLength = true;
            } else { 
              TProtocolUtil.skip(iprot, field.type);
            }
            break;
          case CREATED:
            if (field.type == TType.I64) {
              this.created = iprot.readI64();
              this.__isset_created = true;
            } else { 
              TProtocolUtil.skip(iprot, field.type);
            }
            break;
          case UPDATED:
            if (field.type == TType.I64) {
              this.updated = iprot.readI64();
              this.__isset_updated = true;
            } else { 
              TProtocolUtil.skip(iprot, field.type);
            }
            break;
          case DELETED:
            if (field.type == TType.I64) {
              this.deleted = iprot.readI64();
              this.__isset_deleted = true;
            } else { 
              TProtocolUtil.skip(iprot, field.type);
            }
            break;
          case ACTIVE:
            if (field.type == TType.BOOL) {
              this.active = iprot.readBool();
              this.__isset_active = true;
            } else { 
              TProtocolUtil.skip(iprot, field.type);
            }
            break;
          case UPDATESEQUENCENUM:
            if (field.type == TType.I32) {
              this.updateSequenceNum = iprot.readI32();
              this.__isset_updateSequenceNum = true;
            } else { 
              TProtocolUtil.skip(iprot, field.type);
            }
            break;
          case NOTEBOOKGUID:
            if (field.type == TType.STRING) {
              this.notebookGuid = iprot.readString();
            } else { 
              TProtocolUtil.skip(iprot, field.type);
            }
            break;
          case TAGGUIDS:
            if (field.type == TType.LIST) {
              {
                var _list140:TList = iprot.readListBegin();
                this.tagGuids = new Array();
                for (var _i141:int = 0; _i141 < _list140.size; ++_i141)
                {
                  var _elem142:String;
                  _elem142 = iprot.readString();
                  this.tagGuids.push(_elem142);
                }
                iprot.readListEnd();
              }
            } else { 
              TProtocolUtil.skip(iprot, field.type);
            }
            break;
          case RESOURCES:
            if (field.type == TType.LIST) {
              {
                var _list143:TList = iprot.readListBegin();
                this.resources = new Array();
                for (var _i144:int = 0; _i144 < _list143.size; ++_i144)
                {
                  var _elem145:Resource;
                  _elem145 = new Resource();
                  _elem145.read(iprot);
                  this.resources.push(_elem145);
                }
                iprot.readListEnd();
              }
            } else { 
              TProtocolUtil.skip(iprot, field.type);
            }
            break;
          case ATTRIBUTES:
            if (field.type == TType.STRUCT) {
              this.attributes = new NoteAttributes();
              this.attributes.read(iprot);
            } else { 
              TProtocolUtil.skip(iprot, field.type);
            }
            break;
          case TAGNAMES:
            if (field.type == TType.LIST) {
              {
                var _list146:TList = iprot.readListBegin();
                this.tagNames = new Array();
                for (var _i147:int = 0; _i147 < _list146.size; ++_i147)
                {
                  var _elem148:String;
                  _elem148 = iprot.readString();
                  this.tagNames.push(_elem148);
                }
                iprot.readListEnd();
              }
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
      if (this.guid != null) {
        if (isSetGuid()) {
          oprot.writeFieldBegin(GUID_FIELD_DESC);
          oprot.writeString(this.guid);
          oprot.writeFieldEnd();
        }
      }
      if (this.title != null) {
        if (isSetTitle()) {
          oprot.writeFieldBegin(TITLE_FIELD_DESC);
          oprot.writeString(this.title);
          oprot.writeFieldEnd();
        }
      }
      if (this.content != null) {
        if (isSetContent()) {
          oprot.writeFieldBegin(CONTENT_FIELD_DESC);
          oprot.writeString(this.content);
          oprot.writeFieldEnd();
        }
      }
      if (this.contentHash != null) {
        if (isSetContentHash()) {
          oprot.writeFieldBegin(CONTENT_HASH_FIELD_DESC);
          oprot.writeBinary(this.contentHash);
          oprot.writeFieldEnd();
        }
      }
      if (isSetContentLength()) {
        oprot.writeFieldBegin(CONTENT_LENGTH_FIELD_DESC);
        oprot.writeI32(this.contentLength);
        oprot.writeFieldEnd();
      }
      if (isSetCreated()) {
        oprot.writeFieldBegin(CREATED_FIELD_DESC);
        oprot.writeI64(this.created);
        oprot.writeFieldEnd();
      }
      if (isSetUpdated()) {
        oprot.writeFieldBegin(UPDATED_FIELD_DESC);
        oprot.writeI64(this.updated);
        oprot.writeFieldEnd();
      }
      if (isSetDeleted()) {
        oprot.writeFieldBegin(DELETED_FIELD_DESC);
        oprot.writeI64(this.deleted);
        oprot.writeFieldEnd();
      }
      if (isSetActive()) {
        oprot.writeFieldBegin(ACTIVE_FIELD_DESC);
        oprot.writeBool(this.active);
        oprot.writeFieldEnd();
      }
      if (isSetUpdateSequenceNum()) {
        oprot.writeFieldBegin(UPDATE_SEQUENCE_NUM_FIELD_DESC);
        oprot.writeI32(this.updateSequenceNum);
        oprot.writeFieldEnd();
      }
      if (this.notebookGuid != null) {
        if (isSetNotebookGuid()) {
          oprot.writeFieldBegin(NOTEBOOK_GUID_FIELD_DESC);
          oprot.writeString(this.notebookGuid);
          oprot.writeFieldEnd();
        }
      }
      if (this.tagGuids != null) {
        if (isSetTagGuids()) {
          oprot.writeFieldBegin(TAG_GUIDS_FIELD_DESC);
          {
            oprot.writeListBegin(new TList(TType.STRING, this.tagGuids.length));
            for each (var elem149:* in this.tagGuids)            {
              oprot.writeString(elem149);
            }
            oprot.writeListEnd();
          }
          oprot.writeFieldEnd();
        }
      }
      if (this.resources != null) {
        if (isSetResources()) {
          oprot.writeFieldBegin(RESOURCES_FIELD_DESC);
          {
            oprot.writeListBegin(new TList(TType.STRUCT, this.resources.length));
            for each (var elem150:* in this.resources)            {
              elem150.write(oprot);
            }
            oprot.writeListEnd();
          }
          oprot.writeFieldEnd();
        }
      }
      if (this.attributes != null) {
        if (isSetAttributes()) {
          oprot.writeFieldBegin(ATTRIBUTES_FIELD_DESC);
          this.attributes.write(oprot);
          oprot.writeFieldEnd();
        }
      }
      if (this.tagNames != null) {
        if (isSetTagNames()) {
          oprot.writeFieldBegin(TAG_NAMES_FIELD_DESC);
          {
            oprot.writeListBegin(new TList(TType.STRING, this.tagNames.length));
            for each (var elem151:* in this.tagNames)            {
              oprot.writeString(elem151);
            }
            oprot.writeListEnd();
          }
          oprot.writeFieldEnd();
        }
      }
      oprot.writeFieldStop();
      oprot.writeStructEnd();
    }

    public function toString():String {
      var ret:String = new String("Note(");
      var first:Boolean = true;

      if (isSetGuid()) {
        ret += "guid:";
        if (this.guid == null) {
          ret += "null";
        } else {
          ret += this.guid;
        }
        first = false;
      }
      if (isSetTitle()) {
        if (!first) ret +=  ", ";
        ret += "title:";
        if (this.title == null) {
          ret += "null";
        } else {
          ret += this.title;
        }
        first = false;
      }
      if (isSetContent()) {
        if (!first) ret +=  ", ";
        ret += "content:";
        if (this.content == null) {
          ret += "null";
        } else {
          ret += this.content;
        }
        first = false;
      }
      if (isSetContentHash()) {
        if (!first) ret +=  ", ";
        ret += "contentHash:";
        if (this.contentHash == null) {
          ret += "null";
        } else {
            ret += "BINARY";
        }
        first = false;
      }
      if (isSetContentLength()) {
        if (!first) ret +=  ", ";
        ret += "contentLength:";
        ret += this.contentLength;
        first = false;
      }
      if (isSetCreated()) {
        if (!first) ret +=  ", ";
        ret += "created:";
        ret += this.created;
        first = false;
      }
      if (isSetUpdated()) {
        if (!first) ret +=  ", ";
        ret += "updated:";
        ret += this.updated;
        first = false;
      }
      if (isSetDeleted()) {
        if (!first) ret +=  ", ";
        ret += "deleted:";
        ret += this.deleted;
        first = false;
      }
      if (isSetActive()) {
        if (!first) ret +=  ", ";
        ret += "active:";
        ret += this.active;
        first = false;
      }
      if (isSetUpdateSequenceNum()) {
        if (!first) ret +=  ", ";
        ret += "updateSequenceNum:";
        ret += this.updateSequenceNum;
        first = false;
      }
      if (isSetNotebookGuid()) {
        if (!first) ret +=  ", ";
        ret += "notebookGuid:";
        if (this.notebookGuid == null) {
          ret += "null";
        } else {
          ret += this.notebookGuid;
        }
        first = false;
      }
      if (isSetTagGuids()) {
        if (!first) ret +=  ", ";
        ret += "tagGuids:";
        if (this.tagGuids == null) {
          ret += "null";
        } else {
          ret += this.tagGuids;
        }
        first = false;
      }
      if (isSetResources()) {
        if (!first) ret +=  ", ";
        ret += "resources:";
        if (this.resources == null) {
          ret += "null";
        } else {
          ret += this.resources;
        }
        first = false;
      }
      if (isSetAttributes()) {
        if (!first) ret +=  ", ";
        ret += "attributes:";
        if (this.attributes == null) {
          ret += "null";
        } else {
          ret += this.attributes;
        }
        first = false;
      }
      if (isSetTagNames()) {
        if (!first) ret +=  ", ";
        ret += "tagNames:";
        if (this.tagNames == null) {
          ret += "null";
        } else {
          ret += this.tagNames;
        }
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
