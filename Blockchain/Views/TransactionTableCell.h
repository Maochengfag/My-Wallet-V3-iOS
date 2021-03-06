/*
 *
 * Copyright (c) 2012, Ben Reeves. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
 * MA 02110-1301  USA
 */

#import <UIKit/UIKit.h>
#import "BCInsetLabel.h"
#import "Assets.h"

@class LatestBlock, Transaction;

typedef enum {
    TransactionInfoTypeDefault,
    TransactionInfoTypeNonSpendable,
    TransactionInfoTypeShapeshiftSend,
    TransactionInfoTypeShapeshiftReceive,
} TransactionInfoType;

@interface TransactionTableCell : UITableViewCell {
    Transaction * transaction;
    IBOutlet UILabel * dateLabel;
    IBOutlet UIButton * amountButton;
    IBOutlet BCInsetLabel *infoLabel;
    
    IBOutlet UILabel *actionLabel;    
    IBOutlet UIImageView *warningImageView;
}

-(IBAction)transactionClicked:(UIButton * _Nullable)button;
- (void)bitcoinCashTransactionClicked;

@property(nonatomic, strong)  Transaction * transaction;
@property(nonatomic)  LegacyAssetType assetType;

- (void)reload;

- (void)setTxType:(NSString *)txType;
- (void)setDateLabelText:(NSString *)text;
- (void)setButtonText:(NSString *)text;
- (void)setInfoType:(TransactionInfoType)type;

@end
