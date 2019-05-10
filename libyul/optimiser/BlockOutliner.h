/*
	This file is part of solidity.

	solidity is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.

	solidity is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with solidity.  If not, see <http://www.gnu.org/licenses/>.
*/
/**
 * Optimiser component that outlines blocks that occur multiple times.
 */
#pragma once

#include <libyul/optimiser/ASTCopier.h>
#include <libyul/optimiser/BlockClassFinder.h>
#include <libyul/optimiser/NameDispenser.h>
#include <libyul/AsmDataForward.h>
#include <map>

namespace yul
{

/**
 * Optimiser component that outlines blocks that occur multiple times.
 *
 * Prerequisite: Disambiguator and FunctionHoister
 *
 */
class BlockOutliner: public ASTCopier
{
public:
	static void run(Block& _block, NameDispenser& _nameDispenser);

protected:
	Block translate(Block const& _block) override;

private:
	BlockOutliner(std::map<Block const*, Statement> _outlines, NameDispenser& _nameDispenser)
	: m_nameDispenser(_nameDispenser), m_blockOutlines(std::move(_outlines)) {}

	static bool shallOutline(BlockClass const& _blockClass);

	FunctionDefinition blockClassToFunction(
		BlockClass const& _blockClass,
		YulString _functionName
	);


	NameDispenser& m_nameDispenser;
	std::map<Block const*, Statement> m_blockOutlines;
};


}
