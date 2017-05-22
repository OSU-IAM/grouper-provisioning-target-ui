grouperSession = GrouperSession.startRootSession();

// -- add the stem to hold provisioning target attr defs, names, etc
addStem("etc:attribute", "provisioningTargets", "Provisioning Targets")

// -- Add provisioning candidates attr def and attr name
attributeStem = StemFinder.findByName(GrouperSession.staticGrouperSession(), "etc:attribute:provisioningTargets", true);
// ---- attr def
attrDef = attributeStem.addChildAttributeDef("provisioningCandidatesDef", AttributeDefType.attr);
attrDef.setAssignToGroup(true);
attrDef.setAssignToStem(true);
attrDef.setValueType(AttributeDefValueType.string);
attrDef.store();

// ---- attr name
attrDefName = attributeStem.addChildAttributeDefName(attrDef,  "provisioningCandidates", "provisioningCandidates");
attrDefName.setDescription("Grants groups eligibility to assign provisioning attributes.");
attrDefName.store();
attrDefName = attributeStem.addChildAttributeDefName(attrDef,  "provisioningExcludes", "provisioningExcludes");
attrDefName.setDescription("Denies groups eligibility to assign provisioning attributes.");
attrDefName.store();

// -- Add internal provisioning target def
internalAttrDef = attributeStem.addChildAttributeDef("provisioningTargetInternalDef", AttributeDefType.attr);
internalAttrDef.setAssignToGroup(true);
internalAttrDef.setValueType(AttributeDefValueType.string);
internalAttrDef.store();

// -- Add provisioning target def
// ----  Group admins will need READ and UPDATE on this attribute
attrDef = attributeStem.addChildAttributeDef("provisioningTargetDef", AttributeDefType.attr);
attrDef.setAssignToGroup(true);
attrDef.setValueType(AttributeDefValueType.string);
attrDef.store();

// -- add a stem to hold provisioning targets
// ---- Box
addStem("etc:attribute:provisioningTargets", "box", "Box");
// ------ create target attributes editable via UI
attributeStem = StemFinder.findByName(GrouperSession.staticGrouperSession(), "etc:attribute:provisioningTargets:box", true);
attrDefName = attributeStem.addChildAttributeDefName(attrDef,  "provision", "Provision");
attrDefName.setDescription("**Warning**  Un-checking this check box will remove the group from Box.");
attrDefName.store();
attrDefName = attributeStem.addChildAttributeDefName(attrDef,  "visibility", "Visibility");
attrDefName.setDescription("Specifies who can view the members of the group.");
attrDefName.store();
attrDefName = attributeStem.addChildAttributeDefName(attrDef,  "invitability", "Invitabiity");
attrDefName.setDescription("Specifies who can invite the group to collaborate on folders.");
attrDefName.store();
// ------ add internal def names
attrDefName = attributeStem.addChildAttributeDefName(internalAttrDef,  "externalServiceId", "External Service ID");
attrDefName.store();
// ---- DocuSign
addStem("etc:attribute:provisioningTargets", "docusign", "DocuSign");
// ------ create target attributes editable via UI
attributeStem = StemFinder.findByName(GrouperSession.staticGrouperSession(), "etc:attribute:provisioningTargets:docusign", true);
attrDefName = attributeStem.addChildAttributeDefName(attrDef,  "provision", "Provision");
attrDefName.setDescription("**Warning**  Un-checking this check box will remove the group from DocuSign.");
attrDefName.store();
// ------ add internal def names
attrDefName = attributeStem.addChildAttributeDefName(internalAttrDef,  "externalServiceId", "External Service ID");
attrDefName.store();
// ---- AD
addStem("etc:attribute:provisioningTargets", "ad", "AD");
// ------ create target attributes editable via UI
attributeStem = StemFinder.findByName(GrouperSession.staticGrouperSession(), "etc:attribute:provisioningTargets:ad", true);
attrDefName = attributeStem.addChildAttributeDefName(attrDef,  "provision", "Provision");
attrDefName.setDescription("**Warning**  Un-checking this check box will remove the group from AD.");
attrDefName.store();
// ------ add internal def names
attrDefName = attributeStem.addChildAttributeDefName(internalAttrDef,  "externalServiceId", "External Service ID");
attrDefName.store();

