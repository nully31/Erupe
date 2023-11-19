package mhfpacket

import (
	"errors"

	"erupe-ce/common/byteframe"
	"erupe-ce/network"
	"erupe-ce/network/clientctx"
)

// MsgMhfRegistSpabiTime represents the MSG_MHF_REGIST_SPABI_TIME
type MsgMhfRegistSpabiTime struct {
	AckHandle uint32
	Unk0      uint16
}

// Opcode returns the ID associated with this packet type.
func (m *MsgMhfRegistSpabiTime) Opcode() network.PacketID {
	return network.MSG_MHF_REGIST_SPABI_TIME
}

// Parse parses the packet from binary
func (m *MsgMhfRegistSpabiTime) Parse(bf *byteframe.ByteFrame, ctx *clientctx.ClientContext) error {
	// Doesn't really do anything for now
	m.AckHandle = bf.ReadUint32()
	m.Unk0 = bf.ReadUint16()
	return nil
}

// Build builds a binary packet from the current data.
func (m *MsgMhfRegistSpabiTime) Build(bf *byteframe.ByteFrame, ctx *clientctx.ClientContext) error {
	return errors.New("NOT IMPLEMENTED")
}
